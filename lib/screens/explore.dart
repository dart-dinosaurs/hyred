import 'package:flutter/material.dart';
<<<<<<< HEAD
import './widgets/jobCards.dart';
=======
import 'package:main/screens/widgets/jobCard.dart';
>>>>>>> 35676c106ca99710200a035ad416d7bff10c5ed9

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