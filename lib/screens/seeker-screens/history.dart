import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/history_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/screens/widgets/history_card.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<DocumentSnapshot> _jobs;
  bool _loading;

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

  @override
  Widget build(BuildContext context) {
    Future<List<DocumentSnapshot>> setup() async {
      List<Future<DocumentSnapshot>> list = [];
      Provider.of<DocumentSnapshot>(context).data["listings"].forEach((ref) async {
        list.add(ref.get());
      });
      return await Future.wait(list);
    }
    
    print(_jobs);

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
        _jobs.forEach((doc) => {
          _cards.add(HistoryCard(doc)),
        });
        print(_cards);
        return(
          Container(
            child: ListView(
            children: _cards
          ),
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
          )
        );
      }
    }
  }
}