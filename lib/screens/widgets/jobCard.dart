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
    


    Widget _planetValue({String value, String image}) {
      return new Row(
        children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text(value, style: regularTextStyle),
        ]
      );
    }



final jobCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(96.0, 16.0, 16.0, 16.0),
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
            width: 18.0,
            color: new Color(0xff00c6ff)
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: _planetValue(
                  value: job.salary,
                  image: 'assets/images/dollar.png')

              ),
              new Expanded(
                child: _planetValue(
                  value: job.location,
                  image: 'assets/images/location.png')
              )
            ],
          )
        ],
      ),
    );


    
final card = new Container(
  child: jobCardContent,
  height: 124.0,
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
    child: new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0
      ),
      child: new Stack(
        children: <Widget>[
          card,
          planetThumbnail
        ]
      ),
    )
    );

  }
}
