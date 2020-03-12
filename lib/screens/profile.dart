import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:main/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}


class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 12.0),
                child: IconButton(
                  iconSize: 33.0,
                  icon: Icon(Icons.edit),
                  onPressed: () {}
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Column(
                  children: <Widget>[
                  Text(
                    'Richard Hong',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                    )
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
                SizedBox(width: 50.0),
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      image: DecorationImage(
                        image: NetworkImage(
                      'https://avatars2.githubusercontent.com/u/44233784?s=400&v=4'
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
                size: 40.0,
                color: Colors.green,
              ),
              SizedBox(width: 35.0),
              Text(
                'Verified',
                style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    )
              )
            ],),
            SizedBox(height: 28.0),
            Row(children: <Widget>[
              SizedBox(width: 40.0),
              Icon(
                Icons.rate_review,
                size: 40.0,
                color: Colors.yellow.shade700,
              ),
              SizedBox(width: 35.0),
              Text(
                '3 References',
                style: TextStyle(
                      fontSize: 22.0,
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
              'Reviews',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Transform.rotate(
                angle: 180 * pi / 180,
                child: Icon(
                  Icons.format_quote,
                  color: Colors.grey.shade400,
                  size: 60.0
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Check out his notes on Github',
              style: TextStyle(
                fontSize: 21.0,
                ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.format_quote,
                color: Colors.grey.shade400,
                size: 60.0,
              ),
            ),
          ),
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
              'Richard provided',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 22.0),
            Row(children: <Widget>[
              SizedBox(width: 40.0),
              Icon(
                Icons.check_circle_outline,
                size: 30.0,
                color: Colors.green,
              ),
              SizedBox(width: 13.0),
              Text(
                'Government ID',
                style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    )
              ),
              SizedBox(width: 13.0),
              Icon(
                Icons.check_circle_outline,
                size: 30.0,
                color: Colors.green,
              ),
              SizedBox(width: 13.0),
              Text(
                'Photo',
                style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    )
              )
            ],),
            Row(children: <Widget>[
              SizedBox(width: 40.0),
              Icon(
                Icons.remove_circle_outline,
                size: 30.0,
                color: Colors.red,
              ),
              SizedBox(width: 13.0),
              Text(
                'Email address ',
                style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    )
              ),
              SizedBox(width: 13.0),
              Icon(
                Icons.check_circle_outline,
                size: 30.0,
                color: Colors.green,
              ),
              SizedBox(width: 13.0),
              Text(
                'Resume',
                style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    )
              )
            ],),
          SizedBox(height: 30.0,),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text('Logout'),
              textColor: Colors.white,
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              onPressed: () {},
            )
          ),
        ],
      )
    );
  }
}