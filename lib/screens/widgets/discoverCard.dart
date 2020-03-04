import 'package:flutter/material.dart';

class DiscoverCard extends StatelessWidget {

  final String image;
  final String heading;

  DiscoverCard(this.image, this.heading);


  @override
  Widget build(BuildContext context){
    return(
      Container(
        child: Column(
          children: <Widget>[
            Image(image: new AssetImage(image), height: 150,),
            Text(heading),
          ]
        ),
        margin: EdgeInsets.all(50.0),
        height: 200,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              offset: new Offset(10.0, 10.0),
              blurRadius: 50.0,
              spreadRadius: 5,
            )
          ]
        ),
        
      )
    );
  }
}