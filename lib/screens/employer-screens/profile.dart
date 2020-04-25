import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/screens/seeker-screens/settings.dart';
import 'package:provider/provider.dart';
// import 'package:main/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  bool _showProfile = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (!_showProfile) {
      return Settings();
    }
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 15.0,),
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 12.0),
                    child: IconButton(
                      iconSize: 33.0,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {setState(() {
                          _showProfile = false;
                        });
                      }
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                      child: IconButton(
                        iconSize: 33.0,
                        icon: Icon(Icons.edit),
                        onPressed: () {}
                      ),
                  ),
                ),
                SizedBox(width: 12.0,),
            ],),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                SizedBox(width: 60.0),
                Column(
                  children: <Widget>[
                    SizedBox(
                    width: 160.0,
                      child: FittedBox(fit:BoxFit.fitWidth, 
                      child: Text(
                        user.fname + " " + user.lname,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )
                      ),
                      ),
                    ),
                  SizedBox(height: 4.0),
                  SizedBox(
                    width: 160.0,
                      child: FittedBox(fit:BoxFit.fitWidth, 
                      child: Text(
                        user.businessName,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade800,
                        )
                      ),
                      ),
                    ),

                  SizedBox(height: 8.0),
                  Text(
                    'Joined March 2020',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.grey.shade700,
                    )
                  )],
                ),
                SizedBox(width: 75.0),
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      image: DecorationImage(
                        image: NetworkImage(
                      'https://source.unsplash.com/random/100x100'
                        ),
                      )
                    ),
                  ),
              ]
            ),
            SizedBox(height: 30.0),
            Row(children: <Widget>[
              SizedBox(width: 40.0),
              Icon(
                Icons.verified_user,
                size: 29.0,
                color: Colors.green,
              ),
              SizedBox(width: 35.0),
              Text(
                'Verified',
                style: TextStyle(
                      fontSize: 16.5,
                      color: Colors.black,
                    )
              )
            ],),
            SizedBox(height: 25.0),
            Row(children: <Widget>[
              SizedBox(width: 40.0),
              Icon(
                Icons.rate_review,
                size: 29.0,
                color: Colors.yellow.shade700,
              ),
              SizedBox(width: 35.0),
              Text(
                '3 References',
                style: TextStyle(
                      fontSize: 16.5,
                      color: Colors.black,
                    )
              )
            ],),
            SizedBox(height: 25.0),
            Row(children: <Widget>[
              SizedBox(width: 40.0),
              Icon(
                Icons.home,
                size: 29.0,
                color: Colors.grey.shade800,
              ),
              SizedBox(width: 35.0),
              Text(
                "Lives in " + user.city + ", " + user.province,
                style: TextStyle(
                      fontSize: 16.5,
                      color: Colors.black,
                    )
              )
            ],),
            SizedBox(height: 37.0,),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1.5,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ],),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Text(
              '1 Review',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 18,),
          reviewCard("Nice Boss", "Tom Grey"),
          SizedBox(height: 20.0,),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1.5,
            indent: 20.0,
            endIndent: 20.0,
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Text(
              user.fname + ' provided:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 18.0),
            Column(children: <Widget>[
              Row(children: <Widget>[
                SizedBox(width: 55,),
                Icon(
                  Icons.check_circle_outline,
                  size: 25.0,
                  color: Colors.green,
                ),
                SizedBox(width: 30),
                Text(
                  'Government ID',
                  style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )
                ),
              ]),
              Row(children: <Widget>[
                SizedBox(width: 55,),
                Icon(
                  Icons.check_circle_outline,
                  size: 25.0,
                  color: Colors.green,
                ),
                SizedBox(width: 30,),
                Text(
                  'Photo',
                  style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )
                ),
              ]),
            ],),
            Column(children: <Widget>[
              Row(children: <Widget>[
                SizedBox(width: 55,),
                Icon(
                  Icons.remove_circle_outline,
                  size: 25.0,
                  color: Colors.red,
                ),
                SizedBox(width: 30,),
                Text(
                  'Resume',
                  style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )
                ),
              ],),
              Row(children: <Widget>[
                SizedBox(width: 55,),
                Icon(
                  Icons.check_circle_outline,
                  size: 25.0,
                  color: Colors.green,
                ),
                SizedBox(width: 30,),
                Text(
                  'Email address',
                  style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )
                ),
              ]),
            ],),
          SizedBox(height: 30.0,),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1.5,
            indent: 20.0,
            endIndent: 20.0,
          ),
          SizedBox(height: 30.0,),
        ],
      )
    );
  }



  Widget reviewCard(String review, String reviewerName) {
    return Column(
      children: <Widget>[
        Card(
            elevation: 2.0,
            margin: const EdgeInsets.fromLTRB(18.0, 3.0, 18.0, 3.0),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          '"' + review + '"',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                      ],),
                      SizedBox(height: 2,),
                      Row(children: <Widget>[
                        Spacer(),
                        Text(
                          "- " + reviewerName,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ],)
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}