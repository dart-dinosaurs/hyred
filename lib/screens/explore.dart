import 'package:flutter/material.dart';
import './widgets/jobCards.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Container(
        child: new ListView(
          children: <Widget>[
            JobCard(),
            JobCard(),
            JobCard(),
            JobCard(),
            JobCard(),
            JobCard(),
          ],
      )
    );
  }
}