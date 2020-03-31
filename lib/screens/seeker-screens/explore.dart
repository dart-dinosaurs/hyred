import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {

  String category;
  QuerySnapshot jobs;

  Explore(this.category, this.jobs);

  @override
  Widget build(BuildContext context){

    List<DocumentSnapshot> _widgets = jobs.documents.where((doc) => doc.data['categories'].contains(category)).toList();
    List<Widget> _actual = _widgets.map((doc) => JobCard(doc)).toList();

    return new Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text("Explore Jobs!      ")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: ListView(children: _actual)
    );
  }
}

  
