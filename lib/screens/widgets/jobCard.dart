import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/separator.dart';
import './data.dart';
import './details.dart';

class JobCard extends StatelessWidget {
  DocumentSnapshot job;

  bool horizontal;

  JobCard(this.job, {this.horizontal = true});

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 9.0, fontWeight: FontWeight.w400);

    Timestamp _startDate = job.data['beginTime'];
    Timestamp _endDate = job.data['endTime'];

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
              pageBuilder: (_, __, ___) => new DetailPage(job),
            )),
        child: Stack(
          children: <Widget>[
            Card(
              child: _info(context, job, _date),
              elevation: 10,
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
            ),
            Card(
                child: _pic(context, job),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
              ),
          ],
        )
        );
  }
}

Container _info(BuildContext context, DocumentSnapshot job, String date) {
  return (Container(
    height: MediaQuery.of(context).size.height * 0.15,
    width: MediaQuery.of(context).size.width * 0.9,
    //color: Colors.white70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Colors.white70),
    margin:
        EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.01, 0, 0),
    child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Text(job.data['name'],
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
                  Text(job['salary'].toString() + "/hr"),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, size: 20),
                  Text(job['name'])
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
                  Text(date),
                ],
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.4 + 10, 0, 10, 10),
          width: MediaQuery.of(context).size.width * 0.55,
        ),
        Container(
          child: Text("Posted By: " + job['name']),
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.4 + 10, 0, 0, 0),
          width: MediaQuery.of(context).size.width * 0.55,
        )
      ],
    ),
  ));
}

Container _pic(BuildContext context, DocumentSnapshot job) {
  return (Container(
    height: MediaQuery.of(context).size.height * 0.2,
    width: MediaQuery.of(context).size.width * 0.4,
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: NetworkImage("https://source.unsplash.com/featured/?" + job.data['name']),
          fit: BoxFit.cover,
        )),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
  ));
}
