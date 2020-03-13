import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/services/auth.dart';
import 'package:provider/provider.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: color,
      body: Column(
        children: [
          Text(user.uid),
          Text(user.registered.toString()),
          ]
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Placeholder"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            }, 
            icon: Icon(Icons.exit_to_app), 
            label: Text("Logout"),
          )
        ],
      ),
    );
  }
}
