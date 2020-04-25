import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main/router.dart';
import 'date_time_picker.dart';

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
    //Wasn't sure if this was the best place to put it
    String time = DateFormat.jm().format(widget.beginTime) +
        " - " +
        DateFormat.jm().format(widget.endTime);

    return GestureDetector(
        onTap: () {
          Router.sailor.navigate("/employer/listing_detail", params: {
            "name": widget.name,
          });
        },
        child: Stack(
          children: <Widget>[
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
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
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 25,
                              ),
                              Text("${widget.salary}/hr",),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, size: 20),
                              Container(
                                width: 70,
                                child: Text(
                                  "${widget.name}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 5,
                          10,
                          10,
                          10),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                size: 18,
                              ),
                              Text(
                                  "${months[widget.beginTime.month]} ${widget.beginTime.day}"),
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          10,
                          10),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                size: 20,
                              ),
                              Text(time),
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          10,
                          10),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Text("Applicants: " + ((widget.numberOfApplicants == 0) ? "None": "${widget.numberOfApplicants}")),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                      width: MediaQuery.of(context).size.width * 0.65,
                    )
                    // Container(
                    //   child: Text("Posted By: Me", overflow: TextOverflow.ellipsis, maxLines: 1,),
                    //   margin: EdgeInsets.fromLTRB(
                    //       MediaQuery.of(context).size.width * 0.4 + 10, 0, 0, 0),
                    //   width: MediaQuery.of(context).size.width * 0.65,
                    // )
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image(
                        image: NetworkImage(
                            "https://source.unsplash.com/featured/?" +
                                widget.name),
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
