import 'package:flutter/material.dart';
import 'package:main/screens/searchPage.dart';
import 'package:main/screens/widgets/topJob.dart';
import '../screens/widgets/discoverCard.dart';
import './widgets/data.dart';

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
    return ListView(
      children: <Widget>[
        Container(
          child: TextFormField(
            initialValue: searchValue,
            onChanged: (value) => {setSearch(value)},
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                prefixIcon: Icon(Icons.search)),
          ),
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
        Container(
          height: 10,
        ),
        searchValue != ""
        //TODO: REPLACE SEARCH HERE!!! 
            ? Text("HELLO")
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
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            child: DiscoverCard('assets/images/retail.jpg',
                                "Retail", retailJobs),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          ),
                          Container(
                            child: DiscoverCard('assets/images/BrickLayer.jpg',
                                "Construction", constructionJobs),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          ),
                          Container(
                            child: DiscoverCard('assets/images/cleaning.jpg',
                                "Janitorial", janitorialJobs),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          ),
                        ],
                      )),
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
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  ),
                  Container(
                    child: Text(
                      "See highest paying and reviewed jobs!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    height: 30,
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: TopJob(
                            'assets/images/waiter.jpg',
                            'Waiter',
                            '\$17/hr + Tips',
                            'Serve and Wait on tables at Yonge street warehouse',
                            topJobs[0]),
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Container(
                        child: TopJob(
                            'assets/images/mover.jpg',
                            'Mover',
                            '\$16/hr',
                            'Move furniture and other items into the truck',
                            topJobs[1]),
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: TopJob(
                            'assets/images/assembly.jpg',
                            'Packer',
                            '\$15/hr',
                            'Work on an assembly line and pack mugs',
                            topJobs[2]),
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Container(
                        child: TopJob(
                            'assets/images/cashier.jpg',
                            'Cashier',
                            '\$16/hr',
                            'Serve as a cashier and help customers with their purchases',
                            topJobs[3]),
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              )
      ],
    );
  }
}
