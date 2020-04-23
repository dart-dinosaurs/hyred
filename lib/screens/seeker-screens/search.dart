import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/jobCard.dart';

class Search extends StatelessWidget {
  final String searchValue;
  List<DocumentSnapshot> allJobs;

  Search(this.searchValue, this.allJobs);

  List<DocumentSnapshot> hits = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < allJobs.length; i++) {
      if (allJobs[i].data['name'].contains(searchValue) || allJobs[i].data['categories'].contains(searchValue)) {
        hits.add(allJobs[i]);
      }
    }


    return (
        Column(
      children: hits
          .map((item) => Container(
                child: new JobCard(item),
              ))
          .toList(),
    ));
  }
}