import 'package:flutter/material.dart';
import './jobCard.dart';

class JobCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          JobCard()
        ],
      )
    );
  }
}