import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/job_card.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  String searchValue;
  final List<DocumentSnapshot> allJobs;

  Search(this.searchValue, this.allJobs);

  onChangeSearch(String value) {
    searchValue = value;
  }

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<DocumentSnapshot> _jobs;
  bool _loading;

  @override
  void initState() {
    _loading = true;
    super.initState();
  }

  void setData(List<DocumentSnapshot> newData) {
    this.setState(() {
      _jobs = newData;
      _loading = false;
    });
  }

  List<DocumentSnapshot> hits = [];

  @override
  Widget build(BuildContext context) {
    Future<List<DocumentSnapshot>> setup() async {
      List<Future<DocumentSnapshot>> list = [];
      widget.allJobs.forEach((job) async {
        list.add(job.data['user'].get());
      });
      return await Future.wait(list);
    }

    hits = [];
    if (Provider.of<DocumentSnapshot>(context) == null) {
      return (Loading());
    } else {
      if (_loading) {
        setup().then((list) {
          setData(list);
        });
        return Loading();
      } else {
        for (int i = 0; i < widget.allJobs.length; i++) {
          if (widget.allJobs[i].data['name']
                  .toLowerCase()
                  .contains(widget.searchValue.toLowerCase()) ||
              widget.allJobs[i].data['categories']
                  .toLowerCase()
                  .contains(widget.searchValue.toLowerCase()) ||
              _jobs[i]
                  .data['businessName']
                  .toLowerCase()
                  .contains(widget.searchValue.toLowerCase())) {
            hits.add(widget.allJobs[i]);
          }
        }
        return (Column(
          children: hits
              .map((item) => Container(
                    child: JobCard(item),
                  ))
              .toList(),
        ));
      }
    }
  }
}
