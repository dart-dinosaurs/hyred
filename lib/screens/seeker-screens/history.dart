import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/seeker-screens/search.dart';
import 'package:main/screens/widgets/history_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/screens/widgets/history_card.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:main/screens/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<DocumentSnapshot> _jobs;
  bool _loading;
  String searchValue = "";

  @override
  void initState(){
    _loading = true;
    super.initState();
  }

  void setData(List<DocumentSnapshot> newData){
    this.setState(
      (){
        _jobs = newData;
        _loading = false;
      }
    );
  }

  void setSearch(String value) {
    setState(() {
      searchValue = value;
    });
  }

  TextEditingController myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Future<List<DocumentSnapshot>> setup() async {
      List<Future<DocumentSnapshot>> list = [];
      Provider.of<DocumentSnapshot>(context).data["listings"].forEach((ref) async {
        list.add(ref.get());
      });
      return await Future.wait(list);
    }
    
    if (Provider.of<DocumentSnapshot>(context) == null) {
      return (Loading());
    } else {
      if(_loading){
        setup().then((list){
        setData(list);
      });
        return Loading();
      } else {
        List<Widget> _cards = [];
        _jobs.reversed.forEach((doc) => {
          _cards.add(HistoryCard(doc)),
        });
        print(_cards);
        return(
          ListView(children: <Widget>[
              SearchBar(controller: myController, onChange: (value) => {setSearch(value)}),
              searchValue != "" 
                ? Search(searchValue, _jobs)
                : Column(children: _cards)
          ,
          ]
          )
        );
    }
    }
  }
}