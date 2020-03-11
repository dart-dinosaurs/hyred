import 'package:flutter/material.dart';
import './widgets/data.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {

  final List job;

  Explore(this.job);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new ListView.builder(
        itemBuilder: (context, index) => new JobCard(job[index]),
        itemCount: job.length,
      ),
    );
  }
}