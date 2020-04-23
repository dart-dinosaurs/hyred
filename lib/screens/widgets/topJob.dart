import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/details.dart';
import './data.dart';

class TopJob extends StatelessWidget {

  final DocumentSnapshot job;

  TopJob(this.job);

  @override
  Widget build(BuildContext context){

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


    return(
      GestureDetector(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Container(child: DetailPage(job))),
        ),
      
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only( topLeft: Radius.circular(20), topRight: Radius.circular(20) ),child: Image(image: new NetworkImage("https://source.unsplash.com/featured/?" + job.data['name']), width: MediaQuery.of(context).size.width * 0.45, height: 150, fit: BoxFit.cover, )),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 150,
              child: Column(children: <Widget>[
                Container(height: 10,),
                Container(child: Text(job.data['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 30,),
                Container(child: Text(_date , style: TextStyle(fontWeight: FontWeight.w100,), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 30),
                Container(child: Text("\$" + job.data['salary'].toString() + "/hr" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 40),
                Container(child: Text(job.data['description'], style: TextStyle( color: Colors.black), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40,),
              ],),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)  
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      offset: new Offset(1.0, 00.0),
                      blurRadius: 5.0,
                      spreadRadius: 1,
                    )
                  ]
                ),
              )
          ]
        ),
      )
      )
    );
  }
}