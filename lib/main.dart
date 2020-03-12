import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/settings.dart';
import './screens/profile.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyred',
      home: Home(),
    );
  }
}
