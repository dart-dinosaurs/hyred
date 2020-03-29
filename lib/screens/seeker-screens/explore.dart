import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Explore extends StatelessWidget {

  final String category;
  final QuerySnapshot jobs;

  Explore(this.category, this.jobs);

  @override
  Widget build(BuildContext context){

    //List<Widget> _widgets = jobs.documents.map((doc) => Text(doc.data['test']),).toList();


    List<DocumentSnapshot> _widgets = jobs.documents.where((doc) => doc.data['categories'].contains(category)).toList();
    List<Widget> _actual = _widgets.map((doc) => JobCard(doc)).toList();

    return new Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text("Explore Jobs!      ")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      // body: StreamBuilder(
      //   stream: Firestore.instance.collection('jobs').snapshots(),
      //   builder: (context, snapshot){
      //     if (!snapshot.hasData){
      //       return (Text("Loading..."));
      //     }
      //     return ListView.builder(
      //       itemBuilder: (context, index){
      //         DocumentSnapshot doc = snapshot.data.documents[index];
      //         if (doc['categories'].contains(category)){
      //           return JobCard(doc);
      //         } else {
      //           return Container(height: 0,);
      //         }
      //       },
      //       itemCount: 2,
      //     );
      //   },
      // )
      
      body: ListView(children: _actual)
    );
  }
}

  
