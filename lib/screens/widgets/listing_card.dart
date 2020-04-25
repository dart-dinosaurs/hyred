import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main/router.dart';
import 'date_time_picker.dart';

class ListingCard extends StatefulWidget {
  final List<dynamic> applicants;
  final DateTime beginTime;
  final DateTime endTime;
  final List<dynamic> categories;
  final String description;
  final String requirements;
  final String name;
  final int numberOfApplicants;
  final double salary;
  final dynamic filledBy;
  final DocumentReference reference;

  ListingCard({
    @required this.applicants,
    @required this.beginTime,
    @required this.endTime,
    @required this.categories,
    @required this.description,
    @required this.name,
    @required this.requirements,
    @required this.numberOfApplicants,
    @required this.salary,
    this.filledBy,
    @required this.reference,
  });

  @override
  _ListingCardState createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  @override
  Widget build(BuildContext context) {
    String time = DateFormat.jm().format(widget.beginTime) +
        " - " +
        DateFormat.jm().format(widget.endTime);

    return GestureDetector(
        onTap: () {
          Router.sailor.navigate("/employer/listing_detail", params: {
            "name": widget.name,
            "applicants": widget.applicants,
            "categories": widget.categories,
            "salary": widget.salary,
            "reference": widget.reference
          });
        },
        child: Stack(
          children: <Widget>[
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.white70),
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.02, 0, 0),
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
                          5,
                          0,
                          0),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 25,
                              ),
                              Text(
                                "${widget.salary}/hr",
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
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
                          5,
                          10,
                          5),
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
                                  " ${months[widget.beginTime.month]} ${widget.beginTime.day}"),
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
                          4),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.horizontal,
                            children: widget.filledBy.runtimeType == DocumentReference ? [Text("Applicant Selected", style: TextStyle(fontWeight: FontWeight.bold))] : [
                              Icon(
                                Icons.person,
                                size: 20,
                              ),
                              Text(
                                "Applicants: " +
                                    ((widget.numberOfApplicants == 0)
                                        ? "None"
                                        : "${widget.numberOfApplicants}"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                      width: MediaQuery.of(context).size.width * 0.65,
                    ),
                  ],
                ),
              ),
              elevation: 3,
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
              ),
            ),
          ],
        ));
  }
}
