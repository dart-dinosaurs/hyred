import 'package:flutter/material.dart';

class ShowDialog {
  static void complete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("You're done!"),
          content: new Text(
              "Thank you for registering, once we have reviewed your identification details, your account will be active."),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void error(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Form fields musn't be empty!"),
          actions: <Widget>[
            new FlatButton(
              child: Text(
                "Close",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void custom(BuildContext context, String title, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(error),
          actions: <Widget>[
            new FlatButton(
              child: Text(
                "Close",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
