import 'package:flutter/material.dart';
import 'package:main/router.dart';
import 'package:main/screens/wrapper.dart';
import 'package:main/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

import 'models/user.dart';

void main(){
  Router.createRoutes();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          accentColor: Color(0xFF45CFCF),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Color(0xFF05A8AA),
              ),
            ),
          ),
        ),
        title: 'Hyred',
        home: Wrapper(),
        onGenerateRoute: Router.sailor.generator(),
        navigatorKey: Router.sailor.navigatorKey,
      ),
    );
  }
}
