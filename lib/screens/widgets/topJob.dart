import 'package:flutter/material.dart';
import 'package:main/screens/widgets/details.dart';
import './data.dart';

class TopJob extends StatelessWidget {

  final String image;
  final String heading;
  final String salary;
  final String description;
  final Job job;

  TopJob(this.image, this.heading, this.salary, this.description, this.job);


  @override
  Widget build(BuildContext context){
    return(
      GestureDetector(
        // onTap: () => Navigator.push(
        // context,
        // MaterialPageRoute(
        //     builder: (context) => new Container(child: DetailPage(job))),
        // ),
      
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only( topLeft: Radius.circular(20), topRight: Radius.circular(20) ),child: Image(image: new AssetImage(image), width: MediaQuery.of(context).size.width * 0.45, height: 150, fit: BoxFit.cover, )),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 150,
              child: Column(children: <Widget>[
                Container(height: 10,),
                Container(child: Text(job.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 30,),
                Container(child: Text((job.salary).substring(0, job.salary.length), style: TextStyle(fontWeight: FontWeight.w100, color: Colors.grey), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 40),
                Container(child: Text(job.description, style: TextStyle( color: Colors.black), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40,),
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