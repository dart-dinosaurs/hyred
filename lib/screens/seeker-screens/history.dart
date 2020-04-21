import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/historyCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:provider/provider.dart';


class History extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // var jobs = Provider.of<QuerySnapshot>(context);

    List<DocumentSnapshot> _widgets;
  

    if (Provider.of<DocumentSnapshot>(context) == null){
      return(
        Loading()
      );
    }
    dynamic user_data = Provider.of<DocumentSnapshot>(context).data;

    DocumentSnapshot ac;
    user_data['listings'].forEach((ref) => {
      ref.get().then((value) => {
        print(value.data),
        _widgets.add(value.data)
      })
    });
    List<Widget> _actual = _widgets.map((doc) => HistoryCard(doc)).toList();
     print(_widgets);

    return(
      ListView(children: _actual)
    );
  }
}