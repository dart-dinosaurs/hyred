import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/historyCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<DocumentSnapshot> _jobs;

  void setData(List<DocumentSnapshot> newData){
    print(newData);
    this.setState(
      (){
        _jobs = newData;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> _widgets;

    if (Provider.of<DocumentSnapshot>(context) == null) {
      return (Loading());
    }
    
    void setup() {
      dynamic user_data = Provider.of<DocumentSnapshot>(context).data;
      user_data['listings'].forEach((ref) => {
            ref.get().then((value) => {setData([..._jobs, value])})
          });
    }

    return (
        //ListView(children: _actual)
        Text("hi"));
  }
}
