import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  List<DocumentSnapshot> _employerData;
  bool _loading;
  String searchValue = "";

  @override
  void initState(){
    _loading = true;
    _jobs = [];
    _employerData = [];
    super.initState();
  }

  void setData(List<DocumentSnapshot> newData){
    this.setState(
      (){
        _jobs = newData;
        
      }
    );
  }

  void setEmployerData(List<DocumentSnapshot> employerData){
    this.setState(() {
      _employerData = employerData;
      _loading = false;
    });
  }

  void setSearch(String value) {
    setState(() {
      searchValue = value;
    });
  }

  TextEditingController myController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    List<Widget> _cards = [];

    Future<List<DocumentSnapshot>> setup() async {
      List<Future<DocumentSnapshot>> list = [];
      Provider.of<DocumentSnapshot>(context).data["listings"].forEach((ref) async {
        list.add(ref.get());
      });
      return await Future.wait(list);
    }

    Future<List<DocumentSnapshot>> getEmployerData(List<DocumentSnapshot> list) async {
      List<Future<DocumentSnapshot>> employerData = [];
      list.forEach((job) async {
        employerData.add(job.data['user'].get());
      });
      return await Future.wait(employerData);
    }


    
    if (Provider.of<DocumentSnapshot>(context) == null) {
      return (Loading());
    } else {
      if(_loading){
        setup().then((list){
          setData(list);
        });
        getEmployerData(_jobs).then((employerData) {
          setEmployerData(employerData);
        });
        
        return Loading();
      } else {
        
        _jobs.reversed.forEach((doc) => {
          _cards.add(HistoryCard(doc)),
        });
        List<Widget> hits = [];

        for (int i = 0; i < _jobs.length; i++){
          if (_jobs[i].data['name'].toLowerCase().contains(searchValue.toLowerCase())
            || _jobs[i].data['categories'].contains(searchValue.toLowerCase())
            || _employerData[i].data['businessName'].toLowerCase().contains(searchValue.toLowerCase())
            || _employerData[i].data['city'].toLowerCase().contains(searchValue.toLowerCase()) 
          ){
          hits.add(HistoryCard(_jobs[i]));
          }
        }

        return(
          ListView(children: <Widget>[
              SearchBar(controller: myController, onChange: (value) => {setSearch(value)}),
              searchValue != "" 
                ? Column(children: hits)
                : Column(children: _cards)
          ,
          ]
          )
        );
    }
    }
  }
}
