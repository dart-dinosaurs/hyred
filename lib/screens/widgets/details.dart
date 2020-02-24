import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            //_getBackground(),
            //_getGradient(),
            //_getContent(),
            //_getToolbar(context)
          ],
          ),
      )
    );
  }
}

// Container _getBackground () {
//   return new Container(
//     child: new Image.network(job.picture,
//     fit: BoxFit.cover,
//     height: 300.0
//     ),
//     constraints: new BoxConstraints.expand(height: 300.0),
//   );
// }

Widget _getContent() {
  return new ListView(
    padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: <Widget>[],
  );
}