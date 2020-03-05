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


    final planetThumbnail = new Container(
    width: 90,
    height: 90,
     margin: new EdgeInsets.symmetric(
       vertical: 16.0
     ),
     decoration: new BoxDecoration(
       shape: BoxShape.circle,
       image: new DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(job.image)),
     ),
     alignment: FractionalOffset.centerLeft,
    //  child: new Image(
    //    image: new AssetImage(job.image),
    //    height: 92.0,
    //    width: 92.0,
       
    // ),
  );
    


    Widget _planetValue({String value, IconData image}) {
      return new Row(
        children: <Widget>[
          Icon(image, color: Colors.white,),
          new Container(width: 5.0),
          new Text(value, style: regularTextStyle),
        ]
      );
    }



final jobCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(job.name,
            style: headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(job.description,
            style: subHeaderTextStyle

          ),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 180.0,
            color: Colors.white
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: _planetValue(
                  value: job.salary,
                  image: Icons.attach_money)
              ),
              new Expanded(
                child: _planetValue(
                  value: job.location,
                  image: Icons.location_on)
              )
            ],
          )
        ],
      ),
    );


    
final card = new Container(
  child: jobCardContent,
  height: 124.0,
  width: 300,
  margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
     decoration: new BoxDecoration(
       color: Colors.blue,
       shape: BoxShape.rectangle,
       borderRadius: new BorderRadius.circular(8.0),
       boxShadow: <BoxShadow>[
        new BoxShadow(  
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
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
