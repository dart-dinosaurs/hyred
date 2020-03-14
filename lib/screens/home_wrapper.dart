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
  @override
  HomeWrapperState createState() => HomeWrapperState();
}

class HomeWrapperState extends State<HomeWrapper> {

  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    bool registered = Provider.of<DocumentSnapshot>(context).data["registered"];

    void changeRegistered = () => {
      setState((){
        registered = false;
      })
    };

    try{
      if(!registered){
        return Registration();
      }
      return Registration();
    } catch (err){
      print(err.toString());
      return Registration();
    }
  }
}