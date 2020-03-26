import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './widgets/data.dart';
import 'dart:async';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {

  final String category;

  Explore(this.category);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text("Explore Jobs!      ")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      // body: new ListView.builder(
      //   itemBuilder: (context, index) => new JobCard(job[index]),
      //   itemCount: job.length,
      // ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('jobs').snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return (Text("Loading..."));
          }
          return ListView.builder(
            itemBuilder: (context, index){
              DocumentSnapshot doc = snapshot.data.documents[index];
              if (doc['categories'].contains(category)){
                return JobCard(doc);
              } else {
                return Text("hi");
              }
            },
            itemCount: 2,
          );
        },
      )
    );
  }
}

  
