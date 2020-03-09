import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/screens/Newexplore.dart';
import 'package:main/screens/wrapper.dart';
import 'package:main/services/auth.dart';
import 'package:provider/provider.dart';
import './screens/explore.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Montserrat',
            accentColor: Color(0xFF05A8AA),
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xFF05A8AA))),
            )),
        title: 'Hyred',
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          '/detail': (_) => new Explore(),
        },
      ),
    );
  }
}
