import 'package:flutter/material.dart';
import 'package:main/screens/widgets/data.dart';
import 'package:main/screens/widgets/jobCard.dart';

class MySearch extends StatelessWidget {
  final String searchValue;

  MySearch(this.searchValue);

  List<Job> allJobs = topJobs;
  List<Job> hits = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < allJobs.length; i++) {
      if (allJobs[i].name.contains(searchValue) || allJobs[i].employer.contains(searchValue)) {
        hits.add(allJobs[i]);
      }
    }

    if (hits.length == 0){
      hits = allJobs;
    }

    return (
        // ListView.builder(
        //   itemBuilder: (BuildContext context, int index){
        //     return new JobCard(hits[index]);
        //   },
        //   itemCount: hits.length,
        // )
        Column(
      children: hits
          .map((item) => Container(
                child: new JobCard(item),
              ))
          .toList(),
    ));
  }
}
