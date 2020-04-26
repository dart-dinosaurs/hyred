import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/data.dart';
import '../widgets/separator.dart';

class HistoryPage extends StatelessWidget {
  DocumentSnapshot job;

  HistoryPage(this.job);

  @override
  Widget build(BuildContext context) {

    String date = DateFormat.MMMMd().format(job.data['beginTime'].toDate());
    String time = DateFormat.jm().format(job.data['beginTime'].toDate()) + " - " + DateFormat.jm().format(job.data['endTime'].toDate());
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            _getContent(context, date, time),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Image(
        image: new NetworkImage("https://source.unsplash.com/featured/?" +  job['name']),
        fit: BoxFit.cover,
        height: 150.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getContent(BuildContext context, String date, String time) {

    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
        children: <Widget>[
          _getBackground(),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Align(
                      child: Text(
                        job['name'].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Date",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                height: 30,
                              ),
                              Icon(
                                Icons.local_activity,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text("Time",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 10,
                              ),
                              Text(
                                time,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.attach_money, color: Colors.grey),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Compensation",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                job['salary'].toString()  + " /hr",
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: 30,
                              ),
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Hosted In",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text("English",
                                  style: TextStyle(fontSize: 18)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    ),
                  ]),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Text(
                          "What You'll Do:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 15,
                      ),
                      Align(
                        child:
                            Text(job['description'].toString()),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 20,
                      ),
                      Align(
                        child: Text(
                          "Employee Requirements:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 8,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * .05,
                      0,
                      MediaQuery.of(context).size.width * .05,
                      0),
                ),
                Container(
                  child: Column(
                      children: <Widget>[
                        Text(job.data['requirements'])
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}

