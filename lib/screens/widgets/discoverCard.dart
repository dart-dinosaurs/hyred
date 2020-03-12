import 'package:flutter/material.dart';
import '../explore.dart';
import './data.dart';

class DiscoverCard extends StatelessWidget {
  final String image;
  final String heading;
  final List job;

  DiscoverCard(this.image, this.heading, this.job);

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Container(child: Explore(job))),
      ),
      child: Container(
        
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(1.0, 1.0),
            blurRadius: 10,
            spreadRadius: 1,
            
          )
        ],
      
        ),
        child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image(
                image: new AssetImage(image),
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              )),
          Container(
            width: 150,
            height: 50,
            child: Column(
              children: <Widget>[
                Container(
                  height: 10,
                ),
                Text(heading,
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 20))
              ],
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          )
        ]),
      ),
    ));
  }
}
