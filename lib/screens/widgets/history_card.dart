import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/seeker-screens/historyDetails.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:main/screens/widgets/months.dart';
import 'package:intl/intl.dart';
import './details.dart';

class HistoryCard extends StatefulWidget {
  @override
  _HistoryCardState createState() => _HistoryCardState();

  DocumentSnapshot job;

  HistoryCard(this.job);
}

class _HistoryCardState extends State<HistoryCard> {
  bool loading;
  bool isAccepted;
  dynamic userData;
  @override
  void initState() {
    super.initState();
    loading = true;
    userData = "";
    isAccepted = false;
    getUserData().then((snapshot) {
      setState(() {
        userData = snapshot.data;
        loading = false;
      });
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    return await widget.job.data['user'].get();
  }


  @override
  Widget build(BuildContext context) {

   

    String date = DateFormat.MMMMd().format(widget.job.data['beginTime'].toDate());
    String startTime = DateFormat.jm().format(widget.job.data['beginTime'].toDate());
    String endTime = DateFormat.jm().format(widget.job.data['endTime'].toDate());
    if (loading){
      return(Loading());
    }
    else{
    return new GestureDetector(
        onTap: () => Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new HistoryPage(widget.job),
            )),
        child: Stack(
          children: <Widget>[
            Card(
              child: Container(
                height: 160,
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
                      child: Text(widget.job.data['name'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                    ),
                    Container(height: 5,),
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
                              Text(" " + date)
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
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            size: 20,
                          ),
                          Text(" " +  startTime + " - " + endTime)
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
                      child: Text(loading ? "Posted by: Loading..." : "Posted By: " + userData['businessName'], maxLines: 1, overflow: TextOverflow.ellipsis,),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
                          0,
                          0),
                      width: MediaQuery.of(context).size.width * 0.55,
                    ),
                    Container(
                      child: Text("Status: " + (isAccepted ? "Accepted" : "Pending"), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          10,
                          0,
                          0),
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
                child: _pic(context, widget.job),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
          ],
        ));
  }
}

Container _pic(BuildContext context, DocumentSnapshot job) {
  return (Container(
    height: MediaQuery.of(context).size.height * 0.20,
    width: MediaQuery.of(context).size.width * 0.4,
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: NetworkImage(
              "https://source.unsplash.com/featured/?" + job.data['name']),
          fit: BoxFit.cover,
        )),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    )
  );
}
}