import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListingCard extends StatefulWidget {
  List<dynamic> applicants;
  DateTime beginTime;
  DateTime endTime;
  List<dynamic> categories;
  String description;
  String requirements;
  String name;
  int numberOfApplicants;
  double salary;

  ListingCard(
      {@required this.applicants,
      @required this.beginTime,
      @required this.endTime,
      @required this.categories,
      @required this.description,
      @required this.name,
      @required this.requirements,
      @required this.numberOfApplicants,
      @required this.salary});

  @override
  _ListingCardState createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Stack(
      children: <Widget>[
        Card(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.white70),
            margin: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0.01, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(widget.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.4 + 10, 0, 0, 0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            size: 18,
                          ),
                          Text("${widget.salary} /h"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on, size: 20),
                          Text("${widget.name}")
                        ],
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.4 + 5, 10, 10, 10),
                  width: MediaQuery.of(context).size.width * 0.55,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            size: 20,
                          ),
                          Text(widget.beginTime.toString()),
                        ],
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.4 + 10, 0, 10, 10),
                  width: MediaQuery.of(context).size.width * 0.55,
                ),
                Container(
                  child: Text("Posted By: ME"),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.4 + 10, 0, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.55,
                )
              ],
            ),
          ),
          elevation: 10,
          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Card(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image(
                    image: NetworkImage(
                        "https://source.unsplash.com/featured/?" + widget.name),
                    fit: BoxFit.cover,
                  )),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            elevation: 5,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
      ],
    ));
  }
}
