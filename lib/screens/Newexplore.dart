import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/widgets/topJob.dart';
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
          ),
          height: 40,
        ),
        Container(
          height: 200,
          child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
            Container(child: DiscoverCard('assets/images/retail.jpg', "Retail"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
            Container(child: DiscoverCard('assets/images/BrickLayer.jpg', "Construction"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
            Container(child: DiscoverCard('assets/images/cleaning.jpg', "Janitorial"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
          ],)
        ),
        Container(child: Text("Top Rated Jobs", textAlign: TextAlign.center, style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          ),
          ),
          height: 50,
        ),
        Row(children: <Widget>[
          Container(child: TopJob('assets/images/waiter.jpg', 'Waiter', '\$17/hr + Tips', 'Serve and Wait on tables at Yonge street warehouse'), padding: EdgeInsets.fromLTRB(5, 5, 5, 5),),
          Container(child: TopJob('assets/images/mover.jpg', 'Mover', '\$16/hr', 'Move furniture and other items into the truck'), padding: EdgeInsets.fromLTRB(5, 5, 5, 5),)
        ], mainAxisAlignment: MainAxisAlignment.center,),
        Row(children: <Widget>[
          Container(child: TopJob('assets/images/assembly.jpg', 'Packer', '\$15/hr', 'Work on an assembly line and pack mugs'), padding: EdgeInsets.fromLTRB(5, 5, 5, 5),),
          Container(child: TopJob('assets/images/cashier.jpg', 'Cashier', '\$16/hr', 'Serve as a cashier and help customers with their purchases'), padding: EdgeInsets.fromLTRB(5, 5, 5, 5),)
        ], mainAxisAlignment: MainAxisAlignment.center,)
        ]
    );
  }
}