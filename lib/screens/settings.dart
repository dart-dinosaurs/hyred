import 'package:main/screens/profile.dart';

import 'package:main/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:main/services/auth.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  bool _showProfile = false;
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    if (_showProfile) {
      return Profile();
    }
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 17.0, 15.0, 17.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 15.0),
                InkWell(
                  child: Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://avatars2.githubusercontent.com/u/44233784?s=400&v=4'),
                        )),
                  ),
                ),
                SizedBox(width: 22.0),
                Column(children: <Widget>[
                  Text(
                    'Richard Hong',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.grey.shade900),
                  ),
                  Text(
                    'Scarborough, ON',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontSize: 22.0,
                        color: Colors.grey.shade800),
                  )
                ]),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.grey.shade700,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
            indent: 10.0,
            endIndent: 10.0,
          ),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'A 20 year old male from Scarborough, Ontario. Has mad clout and looking for a job in Cali.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          color: Colors.grey.shade900),
                    ),
                    SizedBox(height: 26.0),
                    Text(
                      'Account Settings',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.grey.shade800),
                    ),
                  ])),
          GestureDetector(
              child: infoCard("Personal Information", Icons.account_circle),
              onTap: () {
                setState(() {
                  _showProfile = true;
                });
              }),
          infoCard("Payment Information", Icons.attach_money),
          infoCard("Notifications", Icons.notifications),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      'Employee Information',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.grey.shade800),
                    ),
                  ])),
          infoCard("References", Icons.attach_file),
          infoCard("Past Jobs", Icons.group),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      'Legal',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.grey.shade800),
                    ),
                  ])),
          infoCard("Terms and Conditions", Icons.assignment),
          GestureDetector(child: infoCard("Log out", Icons.exit_to_app), onTap: () => _auth.signOut(),),
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, 7.0, 25.0, 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'copyright ®',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 5.0)
              ],
            ),
          ),
        ],
      ),
    );
  }

// cards
  Widget infoCard(String info, IconData icon) {
    return Column(
      children: <Widget>[
        Card(
            elevation: 0.0,
            margin: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
            // color: Colors.cyan,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        info,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(icon)
                    ],
                  ),
                ],
              ),
            )),
        Divider(
          color: Colors.grey.shade500,
          indent: 20.0,
          endIndent: 20.0,
        )
      ],
    );
  }
}
