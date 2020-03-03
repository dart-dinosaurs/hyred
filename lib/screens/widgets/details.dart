import 'package:flutter/material.dart';
import '../widgets/data.dart';

//import 'package:flutter_planets_tutorial/model/planets.dart';
import '../widgets/separator.dart';
import '../widgets/jobCard.dart';

//import 'package:flutter_planets_tutorial/ui/common/separator.dart';


class DetailPage extends StatelessWidget {

  final Job job;
  final bool horizontal;

  DetailPage(this.job, {this.horizontal = true});

  DetailPage.vertical(this.job): horizontal = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            //_getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  // Container _getBackground () {
  //   return new Container(
  //           child: new Image.network(job.picture,
  //             fit: BoxFit.cover,
  //             height: 300.0,
  //           ),
  //           constraints: new BoxConstraints.expand(height: 295.0),
  //         );
  // }

  Container _getGradient() {
    return new Container(
            margin: new EdgeInsets.only(top: 190.0),
            height: 110.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: <Color>[
                  new Color(0x00736AB7),
                  new Color(0xFF736AB7)
                ],
                stops: [0.0, 0.9],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ),
            ),
          );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new Container(
            child: new ListView(
              padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
              children: <Widget>[
                // new JobCard(job,
                //   horizontal: false,
                // ),
                new Container(
                  padding: new EdgeInsets.symmetric(horizontal: 32.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(_overviewTitle,
                        style: TextStyle(
                          color: const Color(0xffb6b2df),
                          fontSize: 9.0,
                          fontWeight: FontWeight.w400
                        ),),
                      new Separator(),
                      new Text(
                          job.name
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
            margin: new EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top),
            child: new BackButton(color: Colors.white),
          );
  }
}