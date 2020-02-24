import 'package:flutter/material.dart';
import './widgets/jobCards.dart';
//import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Column(children: <Widget>[
        new JobCards(),
      ],)
    );
  }
}