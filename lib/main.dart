import 'package:flutter/material.dart';
//import 'package:main/screens/explore.dart';
import 'package:main/screens/home.dart';
import 'package:main/screens/widgets/details.dart';
import './screens/widgets/data.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyres',
      home: Home(),
    );
  }
}
