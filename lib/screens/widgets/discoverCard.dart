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
            ClipRRect(borderRadius: BorderRadius.only( topLeft: Radius.circular(20), topRight: Radius.circular(20) ),child: Image(image: new AssetImage(image), width: 150, height: 100, fit: BoxFit.cover, )),
            Container(
              width: 150,
              
              height: 50,
              child: Text(heading, textAlign: TextAlign.center, style: TextStyle( fontSize: 20)),
              
              //margin: EdgeInsets.fromLTRB(70, 20, 70, 10),
        //height: 170,
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
    );
  }
}