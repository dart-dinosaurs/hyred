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

    Timestamp _startDate = job.data['jobDetails']['startDate'];
    Timestamp _endDate = job.data['jobDetails']['endDate'];

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
          _info(context, job, _date),
          _pic(context, job),
        ],
        
      )
      // child: Container(
      //   child: Row(
      //     children: <Widget>[
      //       ClipRRect(
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(20),
      //             bottomLeft: Radius.circular(20),
      //             topRight: Radius.circular(50),
      //             bottomRight: Radius.circular(50)),
      //         child: Image(
      //             image: new NetworkImage(job['jobDetails']['image']),
      //             height: 140,
      //             width: 150,
      //             fit: BoxFit.cover),
      //       ),
      //       Column(children: <Widget>[
      //         Container(
      //           child: Text(job['jobDetails']['name'], style: TextStyle(fontSize: 20),),
      //           margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
      //         ),
      //         Container(
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Row(
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.attach_money,
      //                     size: 18,
      //                   ),
      //                   Text(job['jobDetails']['salary'].toString() + "/hr"),
      //                 ],
      //               ),
      //               Row(
      //                 children: <Widget>[
      //                   Icon(Icons.location_on, size: 20),
      //                   Text(job['jobDetails']['location'])
      //                 ],
      //               ),
      //             ],
      //           ),
      //           margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //           width: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         Container(
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Row(
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.calendar_today,
      //                     size: 20,
      //                   ),
      //                   Text(_date),
      //                 ],
      //               ),
      //             ],
      //           ),
      //           margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      //           width: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         Container(
      //           child: Text("Posted By: " + job['jobDetails']['employer']),
      //           margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      //         )
      //       ], crossAxisAlignment: CrossAxisAlignment.start)
      //     ],
      //   ),
      //   height: 140,
      //   margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //   decoration: BoxDecoration(
      //       color: Color.fromRGBO(191, 241, 255, 1),
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(20),
      //           bottomLeft: Radius.circular(20),
      //           topRight: Radius.circular(20),
      //           bottomRight: Radius.circular(20))),
      // ),
    );
  }
}

Container _info (BuildContext context, DocumentSnapshot job, String date){
  return(
    Container(
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Text(job.data['jobDetails']['name'], textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
            margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
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
                        Text(job['jobDetails']['salary'].toString() + "/hr"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, size: 20),
                        Text(job['jobDetails']['location'])
                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(30, 10, 10, 10),
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
                margin: EdgeInsets.fromLTRB(35, 0, 10, 10),
                width: MediaQuery.of(context).size.width * 0.55,
              ),
               Container(
                child: Text("Posted By: " + job['jobDetails']['employer']),
                margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                width:  MediaQuery.of(context).size.width * 0.55,
              )
        ],
      ),
      color: Color.fromRGBO(191, 241, 255, 1),
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.4, MediaQuery.of(context).size.height * 0.015 + 5, 0, 0),
    )
  );
}

Container _pic (BuildContext context,DocumentSnapshot job){
  return(
    Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width *  0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Image(image: NetworkImage(job.data['jobDetails']['image']), fit: BoxFit.cover,)
      ),
      margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
    )
  );
}