import 'package:flutter/material.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(children: <Widget>[
      JobCard(),
      JobCard(),
    ],);
  }
}