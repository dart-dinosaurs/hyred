import 'package:flutter/material.dart';
import './widgets/card.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(children: <Widget>[
      JobCard(),
      JobCard(),
    ],);
  }
}