import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/job_card.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {

  String searchValue;
  List<DocumentSnapshot> allJobs;

  Search(this.searchValue, this.allJobs);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<DocumentSnapshot> _jobs;
  bool _loading;

  @override
  void initState(){
    _loading = true;
    super.initState();
  }

  void setData(List<DocumentSnapshot> newData){
    this.setState(
      (){
        _jobs = newData;
        _loading = false;
      }
    );
  }
  List<DocumentSnapshot> hits = [];

  @override
  Widget build(BuildContext context) {

    Future<List<DocumentSnapshot>> setup() async {
      List<Future<DocumentSnapshot>> list = [];
      Provider.of<DocumentSnapshot>(context).data["listings"].forEach((ref) async {
        list.add(ref.get());
      });
      return await Future.wait(list);
    }

    print(widget.allJobs);

    for (int i = 0; i < widget.allJobs.length; i++) {
      if (widget.allJobs[i].data['name'].contains(widget.searchValue) || widget.allJobs[i].data['categories'].contains(widget.searchValue)) {
        hits.add(widget.allJobs[i]);
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