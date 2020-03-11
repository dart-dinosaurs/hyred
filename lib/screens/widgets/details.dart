import 'package:flutter/material.dart';
import '../widgets/data.dart';
import '../widgets/separator.dart';

class DetailPage extends StatelessWidget {
  final Job job;
  final bool horizontal;

  DetailPage(this.job, {this.horizontal = true});

  DetailPage.vertical(this.job) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            //_getGradient(),
            _getContent(context),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Image(
        image: new AssetImage(job.image),
        fit: BoxFit.cover,
        height: 150.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent(BuildContext context) {
    final _overviewTitle = "overview".toUpperCase();
    var myConditions = job.requirements.split('|');

    List<Widget> list = new List<Widget>();
    for (var i = 0; i < myConditions.length; i++) {
      list.add(new Text(myConditions[i]));
    }
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 310.0, 0.0, 32.0),
        children: <Widget>[
          // new JobCard(job,
          //   horizontal: false,
          // ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    job.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                new Text(
                  'DETAILS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                new Separator(),
                new Row(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(job.salary.substring(1, job.salary.length)),
                    ],),
                    Row(children: <Widget>[
                      Icon(Icons.location_on),
                      Text(job.location),
                    ],),
                    Row(children: <Widget>[
                      Icon(Icons.calendar_today),
                      Text(job.date)
                    ],)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Container(
                  height: 10,
                ),
                new Text(
                  _overviewTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                new Separator(),
                new Text(job.description),
                Container(height: 5),
                new Text(
                  'EMPLOYER REQUIREMENTS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                Separator(),
                Container(
                  child: Column(
                      children: myConditions
                          .map((item) => Container(
                                child: new Text("• " + item,
                                    textAlign: TextAlign.right),
                                margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                              ))
                          .toList(),
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start),
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  alignment: Alignment(0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: RaisedButton(
                    child: Text("Apply Now", style: TextStyle(color: Colors.white),),
                    elevation: 6.0,
                    color: Colors.green,
                    onPressed: () {
                      applyNow(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void applyNow(BuildContext context) {
    var alertDialog = AlertDialog(
      content: Container(
          height: 50,
          width: 100,
          child: Column(
            children: <Widget>[
              Text(
                "Applied",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.check,
                color: Colors.green,
              )
            ],
          )),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
