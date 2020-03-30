import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryDetails extends StatelessWidget {
  final DocumentSnapshot job;

  HistoryDetails(this.job);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
           
            Image(
              image: NetworkImage(job.data['jobDetails']['image']),
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
         Container(
              margin:
                  new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: new BackButton(color: Colors.white),
            ),
      ],
    )));
  }
}
