import 'package:flutter/material.dart';
import './widgets/data.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: new GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 0.1,
          crossAxisSpacing: 0.1,
          childAspectRatio: 0.8,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            JobCard(jobs[0]),
            JobCard(jobs[1]),
            JobCard(jobs[1]),
          ],
      )
    );
  
  }
}