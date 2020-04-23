import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryDetails extends StatelessWidget {
  final DocumentSnapshot job;

  HistoryDetails(this.job);

  @override
  Widget build(BuildContext context) {
    List<String> _headings = [
      'Job Title:',
      'Employer:',
      'Compensation:',
      'Location:',
      'Language:'
    ];
    Map _details = job.data['jobDetails'];
    List<String> _info = [
      _details['name'],
      _details['employer'],
      "\$" + _details['salary'].toString() + "/hr",
      _details['location'],
      _details['language']
    ];

    return (Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Image(
              image: NetworkImage("https://source.unsplash.com/featured/?" + job.data['jobDetails']['name']),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 10,
            ),
            Text(
              "Job Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Container(
              height: 20,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  _column(context, _headings, CrossAxisAlignment.start, TextStyle(fontSize: 15)),
                  _column(context, _info, CrossAxisAlignment.end, TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 0, MediaQuery.of(context).size.width * 0.1, 0),
            )
          ],
        ),
        Container(
          margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new BackButton(color: Colors.white),
        ),
      ],
    )));
  }
}

Container _column(
    BuildContext context, List<String> headings, CrossAxisAlignment alignment, TextStyle style) {
  return (Container(
      child: Column(
        children: headings.map((f) => Container(child: Text(f, style: style,),padding: EdgeInsets.fromLTRB(0, 0, 0, 10),),).toList(),
        crossAxisAlignment: alignment,),
      width: MediaQuery.of(context).size.width *0.4,
  ));
}


