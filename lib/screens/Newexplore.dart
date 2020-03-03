import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import '../screens/widgets/search.dart';

class NewExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 20),
    //       child: SearchBar(),
    //     ),
    //   ),
    // );,
    return ListView(
      children: <Widget>[
        Container(child: MySearch(), height: 100,),
        Container(child: Text("What type of Job are you looking for?", textAlign: TextAlign.center, style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          ))),
        
      ]
    );
  }
}