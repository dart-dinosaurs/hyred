import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/months.dart';
import 'package:main/screens/widgets/separator.dart';
import './data.dart';
import './details.dart';

class JobCard extends StatefulWidget {
  @override
  _JobCardState createState() => _JobCardState();

  DocumentSnapshot job;

  JobCard(this.job);
}

class _JobCardState extends State<JobCard> {
  bool loading;
  dynamic userData;
  @override
  void initState() {
    super.initState();
    loading = true;
    userData = "";
    getUserData().then((snapshot) {
      setState(() {
        userData = snapshot.data;
        loading = false;
      });
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    return await widget.job['user'].get();
  }

  @override
  Widget build(BuildContext context) {
    Timestamp _startDate = widget.job.data['beginTime'];
    Timestamp _endDate = widget.job.data['endTime'];

    String _startDay = _startDate.toDate().day.toString();
    String _startMonth = _startDate.toDate().month.toString();
    String _startYear = _startDate.toDate().year.toString();

    String _endDay = _endDate.toDate().day.toString();
    String _endMonth = _endDate.toDate().month.toString();
    String _endYear = _endDate.toDate().year.toString();

    String _strStart = _startDay + "/" + _startMonth + "/" + _startYear;
    String _strEnd = _endDay + "/" + _endMonth + "/" + _endYear;

    String _date = _strStart + " - " + _strEnd;

    return new GestureDetector(
        onTap: () => Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(widget.job),
            )),
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
                      child: Text(widget.job.data['name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                                size: 18,
                              ),
                              Text(widget.job['salary'].toString() + "/hr"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, size: 20),
                              Text(loading ? "Loading" : userData['city'])
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
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                size: 20,
                              ),
                              Text(
                                  " ${months[widget.job.data['beginTime'].toDate().month]} " +
                                      widget.job.data['beginTime']
                                          .toDate()
                                          .day
                                          .toString()),
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
                          Text(widget.job.data['beginTime'].toDate().hour.toString() + ":" + widget.job.data['beginTime'].toDate().minute.toString() + " - " + widget.job.data['endTime'].toDate().hour.toString() + ":" + widget.job.data['endTime'].toDate().minute.toString())
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
                      child: Text("Posted By: " + widget.job['name']),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.4 + 10,
                          0,
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
    height: MediaQuery.of(context).size.height * 0.25,
    width: MediaQuery.of(context).size.width * 0.4,
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: NetworkImage(
              "https://source.unsplash.com/featured/?" + job.data['name']),
          fit: BoxFit.cover,
        )),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
  ));
}
