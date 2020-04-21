import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/seeker-screens/search.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:main/screens/widgets/topJob.dart';
import 'package:main/screens/widgets/search.dart';
import 'package:main/screens/widgets/discoverCard.dart';
import 'package:main/screens/widgets/data.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String searchValue = "";

  void setSearch(String value) {
    setState(() {
      searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var jobs = Provider.of<QuerySnapshot>(context);
    var jobDocs = null;
    if (jobs == null) {
      return Scaffold(body: Loading());
    } else {
      jobDocs = jobs.documents;
    }

    List<Widget> _createChildren() {
      return new List<Widget>.generate(2, (int index) {
        return TopJob(jobDocs[index]);
      });
    }

    List<Widget> _topJobs = new List<Widget>();

    for (int i = 0; i < industries.length; i++) {
      _topJobs.add(DiscoverCard(industries[i], jobs));
    }

    return ListView(children: <Widget>[
      Container(
        child: TextFormField(
          initialValue: searchValue,
          onChanged: (value) => {setSearch(value)},
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.fromLTRB(10, 8, 0, 0),
              prefixIcon: Icon(Icons.search)),
          style: TextStyle(height: 1.5),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
      searchValue != ""
          ? Search(searchValue, jobDocs)
          : Column(
              children: <Widget>[
                Container(
                    child: Text("Explore Jobs",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                Container(
                    child: Text("See jobs from different industries!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        )),
                      width: MediaQuery.of(context).size.width,
                    height: 20,
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                Container(
                    height: 160,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ListView(
                        scrollDirection: Axis.horizontal, children: _topJobs)
                ),
                Container(
                  child: Text(
                    "Top Rated Jobs",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Container(
                  child: Text(
                    "See the most applied to jobs",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Wrap(
                  children: _createChildren(),
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceBetween,
                )
              ],
            )
    ]);
  }
}
