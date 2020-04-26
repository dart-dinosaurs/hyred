import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/details.dart';
import 'package:intl/intl.dart';

class TopJob extends StatelessWidget {

  final DocumentSnapshot job;

  TopJob(this.job);

  @override
  Widget build(BuildContext context){

    String date = DateFormat.MMMMd().format(job.data['beginTime'].toDate());
    String startTime = DateFormat.jm().format(job.data['beginTime'].toDate());
    String endTime = DateFormat.jm().format(job.data['endTime'].toDate());
    return(
      GestureDetector(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Container(child: DetailPage(job))),
        ),
      
      child: Card(
        child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only( topLeft: Radius.circular(20), topRight: Radius.circular(20) ),child: Image(image: new NetworkImage("https://source.unsplash.com/featured/?" + job.data['name']), width: MediaQuery.of(context).size.width * 0.45, height: 150, fit: BoxFit.cover, )),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 170,
              child: Column(children: <Widget>[
                Container(height: 10,),
                Container(child: Text(job.data['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,), textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,), width: MediaQuery.of(context).size.width * 0.40, height: 30,),
                Container(child: Text( date , style: TextStyle(fontWeight: FontWeight.w100,), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 20),
                Container(child: Text(startTime + " - " + endTime, style: TextStyle(fontWeight: FontWeight.w100,), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 30),
                Container(child: Text("\$" + job.data['salary'].toString() + "/hr" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 30),
                Container(
                  child: Text(job.data['description'], style: TextStyle( color: Colors.black), textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, maxLines: 2,), 
                  width: MediaQuery.of(context).size.width * 0.40,
                ),
              ],),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              )
            ]),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )
          )
        )
      );
  }
}
