import 'package:flutter/material.dart';
import 'package:main/screens/home.dart';
import 'package:main/screens/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Login(),
    );
  }
}