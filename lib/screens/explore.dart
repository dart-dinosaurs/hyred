import 'package:flutter/material.dart';
import './widgets/data.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {

  final List job;

  Explore(this.job);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text("Explore Jobs!      ")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) => new JobCard(job[index]),
        itemCount: job.length,
      ),
    );
  }
}