import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/job_card.dart';
import 'package:main/screens/widgets/loading.dart';

class JobListings extends StatelessWidget {

  final String category;
  final QuerySnapshot jobs;

  JobListings(this.category, this.jobs);

  @override
  Widget build(BuildContext context){

    //List<Widget> _widgets = jobs.documents.map((doc) => Text(doc.data['test']),).toList();
    if (jobs == null){
      return(
        Loading()
      );
    }

    List<DocumentSnapshot> _widgets = jobs.documents.where((doc) => doc.data['categories'].contains(category.toLowerCase())).toList();
    print(_widgets);
    List<Widget> _actual = _widgets.map((doc) => Container(child: JobCard(doc), margin: EdgeInsets.fromLTRB(15, 0, 0, 0),)).toList();

    return new Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text("Explore Jobs!      ")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: ListView(children: _actual)
    );
  }
}

  
