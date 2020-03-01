import 'package:flutter/material.dart';
import 'package:main/screens/wrapper.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        accentColor: Color(0xFF05A8AA),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2, color: Color(0xFF05A8AA)
            )
          ),
        )
      ),
      title: 'Hyred',
      home: Wrapper(),
    );
  }
}
