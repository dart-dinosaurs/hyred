import 'package:flutter/material.dart';
import 'package:main/screens/widgets/data.dart';
import 'package:main/screens/widgets/historyCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/screens/widgets/jobCard.dart';

class History extends StatelessWidget {

  final databaseReference = Firestore.instance;

  void getData(){
    databaseReference
    .collection("jobs")
    .getDocuments()
    .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((doc) => {
        print('${doc.data['salary']}')
      });
    });
  } 

  
  @override
  Widget build(BuildContext context) {
    return Container(
      // HistoryCard(topJobs[0]),
      // HistoryCard(topJobs[1]),
      // HistoryCard(topJobs[2]),
      // HistoryCard(topJobs[3]),
      // HistoryCard(topJobs[1]),
      // RaisedButton(
      //   child: Text("click"),
      //   onPressed: () {
      //     getData();
      //   }
      // ),
      child: StreamBuilder(
        stream: Firestore.instance.collection('jobs').snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return (Text("Loading..."));
          }
          return ListView.builder(
            itemBuilder: (context, index){
              return HistoryCard(snapshot.data.documents[index]);
            },
            itemCount: 1,
          );
        },
      )
    );
  }
}