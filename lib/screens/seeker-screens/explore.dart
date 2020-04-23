import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/seeker-screens/search.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:main/screens/widgets/search_bar.dart';
import 'package:main/screens/widgets/topJob.dart';
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

  final myController = TextEditingController();

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
      return new List<Widget>.generate(1, (int index) {
        return TopJob(jobDocs[index]);
      });
    }

    List<Widget> _topJobs = new List<Widget>();

    for (int i = 0; i < 4; i++) {
      _topJobs.add(DiscoverCard(industries[i], jobs));
    }

    return ListView(children: <Widget>[
      SearchBar(controller: myController, onChange: (value) => {setSearch(value)}),
      Container(height: 10,),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Wrap(
                  children: _createChildren(),
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceAround,
                  runAlignment: WrapAlignment.spaceAround,
                ),
                ),
              ],
            )
    ]);
  }
}
