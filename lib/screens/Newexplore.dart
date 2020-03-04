import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import '../screens/widgets/search.dart';
import '../screens/widgets/discoverCard.dart';

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
        Container(child: Text("Explore Jobs", textAlign: TextAlign.center, style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          )
          )
        ),
        Container(
          height: 250,
          child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
            Container(child: DiscoverCard('assets/images/retail.jpg', "Retail"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
            Container(child: DiscoverCard('assets/images/BrickLayer.jpg', "Construction"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
            Container(child: DiscoverCard('assets/images/cleaning.jpg', "Janitorial"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
          ],)
        ),
        Container(child: Text("Top Rated Jobs", textAlign: TextAlign.center, style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          )
          )
        ),



        ]
    );
  }
}