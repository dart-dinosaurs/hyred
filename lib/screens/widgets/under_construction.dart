import 'package:flutter/material.dart';

class Construction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 200.0,),
                  Text(
                    "This feature will be implemented soon!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    )
                  ),
                  SizedBox(height: 30.0,),
                  Text(
                    "The app is currently in beta",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Theme.of(context).accentColor,
                    )
                  ),
                  SizedBox(height: 75.0,),

                  Image.asset(
                      'assets/images/hammer.png',
                      color: Theme.of(context).accentColor,
                      height: 90.0,)
                ],
            ),
          ),
        ),
    );
  }
}
