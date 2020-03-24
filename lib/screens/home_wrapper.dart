import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/screens/home.dart';
import 'package:main/screens/login.dart';
import 'package:main/screens/register.dart';
import 'package:main/screens/registration.dart';
import 'package:provider/provider.dart';
import 'package:main/services/firestore.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatefulWidget {
  final Function setRegister;
  HomeWrapper({this.setRegister});

  @override
  HomeWrapperState createState() => HomeWrapperState();
}

class HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.uid);

    try {
      if ((Provider.of<DocumentSnapshot>(context) == null)
          ? false
          : Provider.of<DocumentSnapshot>(context).data["registered"]) {
        return Home();
      }
      return Registration(setRegister: widget.setRegister);
    } catch (err) {
      print(err.toString());
    }

    return Registration();
  }
}
