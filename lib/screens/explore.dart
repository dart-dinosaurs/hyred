import 'package:flutter/material.dart';
import './widgets/jobCards.dart';
import './widgets/data.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Container(
        child: new ListView(
          children: <Widget>[
            JobCard(jobs[0]),
            JobCard(jobs[1]),
          ],
      )
    );
  }
}