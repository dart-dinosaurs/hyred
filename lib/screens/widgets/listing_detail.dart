import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/services/firestore.dart';
import 'package:provider/provider.dart';

var months = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "June",
  7: "July",
  8: "Aug",
  9: "Sept",
  10: "Oct",
  11: "Nov",
  12: "Dec",
};

class ListingDetail extends StatefulWidget {
  final String name;
  final List categories;
  final List applicants;
  final double salary;
  final DocumentReference reference;
  final DateTime postDate;

  ListingDetail({
    @required this.name,
    @required this.categories,
    @required this.applicants,
    @required this.salary,
    @required this.reference,
    @required this.postDate,
  });

  @override
  _ListingDetailtate createState() => _ListingDetailtate();
}

class _ListingDetailtate extends State<ListingDetail> {
  bool loading;
  List applicants;

  @override
  initState() {
    super.initState();
    loading = true;
    applicants = [];
    setup();
  }

  void setup() async {
    List awaited = await Future.wait(
        widget.applicants.map((applicant) => applicant.get()));

    setState(() {
      loading = false;
      applicants = awaited.map((snapshot) {
        return ({
          "fname": snapshot.data["fname"],
          "lname": snapshot.data["lname"],
          "city": snapshot.data["city"],
          "province": snapshot.data["province"],
          "reference": snapshot.reference
        });
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.name),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    310,
                    MediaQuery.of(context).size.width * 0.05,
                    10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(children: [
                        Text("Categories: "),
                        ...widget.categories.map((category) {
                          return Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(category),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          );
                        }).toList(),
                      ]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 15, 5, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.attach_money, size: 20),
                                Text("Salary: ${widget.salary} /hr"),
                              ],
                            ),
                            Text("Posted On: ${months[widget.postDate.month]}, ${widget.postDate.day}")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: NetworkImage(
                          "https://source.unsplash.com/featured/400x300/?"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Text(
                      "Applicants",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                loading
                    ? Text("LOADING")
                    : Column(
                        children: <Widget>[
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: applicants
                                  .map((applicant) => ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image(
                                              image: NetworkImage(
                                                  "https://source.unsplash.com/featured/50x50")),
                                        ),
                                        title: Text(
                                            '${applicant["fname"]} ${applicant["lname"]}'),
                                        subtitle: Text(
                                            'From: ${applicant["city"]}, ${applicant["province"]}'),
                                        trailing: RaisedButton(
                                          color: Theme.of(context).accentColor,
                                          onPressed: () {
                                            FirestoreService(uid: Provider.of<User>(context, listen: false).uid).selectCandidate(widget.reference, applicant["reference"]);
                                          },
                                          child: Text(
                                            "Select",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
