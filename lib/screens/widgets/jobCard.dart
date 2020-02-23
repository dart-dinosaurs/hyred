import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0
      ),
      child: new Stack(
        children: <Widget>[
          card,
        ]
      ),
    );
  }
}

final card = new Container(
  height: 124.0,
     decoration: new BoxDecoration(
       color: new Color(0xFF333366),
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