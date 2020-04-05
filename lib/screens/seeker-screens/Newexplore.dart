import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/topJob.dart';
import 'package:main/screens/widgets/search.dart';
import 'package:main/screens/widgets/discoverCard.dart';
import 'package:main/screens/widgets/data.dart';
import 'package:provider/provider.dart';

class NewExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var jobs = Provider.of<QuerySnapshot>(context);
    var jobDocs = jobs.documents;
    
     List<Widget> _createChildren() {
        return new List<Widget>.generate(2, (int index) {
          return TopJob(jobDocs[index]);
        });
      }

     List<Widget> _topJobs = new List<Widget>();

     for (int i = 0; i < industries.length; i++){
       _topJobs.add(DiscoverCard(industries[i], jobs));
     }

    return ListView(children: <Widget>[
      Container(
        child: MySearch(),
        height: 100,
      ),
      Container(
        child: Text("Explore Jobs",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        height: 30,
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      ),
      Container(
        child: Text("See jobs from different industries!",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            )),
        height: 20,
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      ),
      Container(
          height: 160,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _topJobs
          )
      ),
      Container(
        child: Text(
          "Most Popular Jobs",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        height: 30,
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      ),
      Container(
        child: Text(
          "See the most applied to jobs!",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        height: 30,
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      ),
      Wrap(
        children: _createChildren(),
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceEvenly,
      )
    ]);
  }
}
