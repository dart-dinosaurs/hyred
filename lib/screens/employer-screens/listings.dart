import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/router.dart';
import 'package:main/screens/widgets/listing_card.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:main/screens/widgets/search_bar.dart';
import 'package:main/services/firestore.dart';
import 'package:provider/provider.dart';

class ListingsScreen extends StatefulWidget {
  @override
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  TextEditingController _controller = TextEditingController();
  String _search;
  bool loading;
  List data;

  @override
  void initState() {
    this.loading = true;
    this.data = [];
    super.initState();
  }

  void changeSearch(String value) {
    this.setState(() => {_search = value});
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final FirestoreService firestoreService = FirestoreService(uid: user.uid);

    Future setup() async {
      List references = await firestoreService.getListings();
      List<Future<DocumentSnapshot>> list = [];
      references.forEach((reference) {
        list.add(reference.get());
      });
      return await Future.wait(list);
    }

    void setData() async {
      List<DocumentSnapshot> snapshots = await setup();
      List data = [];
      snapshots.forEach((snapshot) {
        dynamic object = snapshot.data;
        object["beginTime"] = object["beginTime"].toDate();
        object["endTime"] = object["endTime"].toDate();
        print(object);
        data.add(object);
      });
      this.setState(() {
        this.loading = false;
        this.data = data;
      });
    }

    List filteredData = _search == null
        ? data
        : data.where((obj) {
            return obj["description"]
                    .toLowerCase()
                    .contains(_search.toLowerCase()) ||
                obj["requirements"]
                    .toLowerCase()
                    .contains(_search.toLowerCase()) ||
                obj["name"].toLowerCase().contains(_search.toLowerCase());
          }).toList();

    if (loading) {
      setData();
      return Loading();
    }

    List<Widget> widgets = filteredData
        .map((obj) => Container(
              child: ListingCard(
                applicants: obj["applicants"],
                beginTime: obj["beginTime"],
                endTime: obj["endTime"],
                categories: obj["categories"],
                description: obj["description"],
                name: obj["name"],
                requirements: obj["requirements"],
                numberOfApplicants: obj["numberOfApplicants"],
                salary: obj["salary"],
              ),
            ))
        .toList();

    print(widgets);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Router.sailor.navigate('/employer/add');
        },
      ),
      body: SafeArea(
        child: this.loading
            ? Loading()
            : Column(
                children: [
                  SearchBar(
                    controller: _controller,
                    onChange: this.changeSearch,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: ListView(children: widgets),
                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                  )
                 ,
                ],
              ),
      ),
    );
  }
}
