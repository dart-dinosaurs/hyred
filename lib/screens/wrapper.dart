import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/screens/home_wrapper.dart';
import 'package:main/screens/seeker-screens/login.dart';
import 'package:main/screens/seeker-screens/register.dart';
import 'package:main/services/firestore.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showRegister = false;

  void toggleRegister() {
    setState(() => showRegister = !showRegister);
  }

  void setRegister() {
    setState(() => showRegister = false);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final _firestore = user == null ? null : FirestoreService(uid: user.uid);
    switch (user) {
      case null:
        if (showRegister) {
          return Register(toggleRegister: toggleRegister);
        }
        return Login(toggleRegister: toggleRegister);
      default:
        return StreamProvider<DocumentSnapshot>.value(
          value: user == null ? false : _firestore.userData,
          child: HomeWrapper(setRegister: setRegister),
        );
    }
  }
}
