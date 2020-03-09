import 'package:flutter/material.dart';
import './data.dart';
import './details.dart';

class JobCard extends StatelessWidget {

  final Job job;

  final bool horizontal;

  JobCard(this.job, {this.horizontal = true});

  @override
  Widget build(BuildContext context) {
    


    final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final regularTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 9.0,
      fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0
    );
    final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );

return new GestureDetector(
  onTap: () => Navigator.of(context).push(new PageRouteBuilder(
    pageBuilder: (_, __, ___) => new DetailPage(job),
  )),
    child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only( topLeft: Radius.circular(20), topRight: Radius.circular(20) ),child: Image(image: new AssetImage(job.image), width: MediaQuery.of(context).size.width * 0.45, height: 150, fit: BoxFit.cover, )),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80,
              child: Column(children: <Widget>[
                Container(height: 10,),
                Container(child: Text(job.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 30,),
                Container(child: Text(job.salary.substring(1, job.salary.length), style: TextStyle(fontWeight: FontWeight.w100, color: Colors.grey), textAlign: TextAlign.left,), width: MediaQuery.of(context).size.width * 0.40, height: 40),
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
              ),
          ]
        ),
        
      );

  }
}
