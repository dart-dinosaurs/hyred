import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/seeker-screens/jobListings.dart';
import 'package:main/screens/widgets/data.dart';
import './data.dart';

class DiscoverCard extends StatelessWidget {
  
  Category industry;
  QuerySnapshot jobs;

  DiscoverCard(this.industry, this.jobs);

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Container(child: JobListings(industry.heading, jobs))),
      ),
      
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image(
                image: NetworkImage("https://source.unsplash.com/" + industry.image + "/400x300"),
                width: 150,
                height: 100,
                
                fit: BoxFit.cover,
              )),
          Container(
            width: 150,
            height:50,
            child: Column(
              children: <Widget>[
                Container(
                  height: 10,
                ),
                Text(industry.heading,
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 20))
              ],
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          )
        ]),
      ),
    ));
  }
}
