import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/data.dart';
import '../widgets/separator.dart';

class DetailPage extends StatelessWidget {
  final DocumentSnapshot job;
  final bool horizontal;

  DetailPage(this.job, {this.horizontal = true});

  DetailPage.vertical(this.job) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    Timestamp _startDate = job.data['beginTime'];
    Timestamp _endDate = job.data['endTime'];

    String _startDay = _startDate.toDate().day.toString();
    String _startMonth = _startDate.toDate().month.toString();
    String _startYear = _startDate.toDate().year.toString();

    String _endDay = _endDate.toDate().day.toString();
    String _endMonth = _endDate.toDate().month.toString();
    String _endYear = _endDate.toDate().year.toString();

    String _strStart = _startDay + "/" + _startMonth + "/" + _startYear;
    String _strEnd = _endDay + "/" + _endMonth + "/" + _endYear;

    String _date = _strStart + " - " + _strEnd;

    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            _getContent(context, _date),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Image(
        image: new NetworkImage("https://source.unsplash.com/featured/?" +  job['name']),
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

  Container _getContent(BuildContext context, String _date) {
    final _overviewTitle = "overview".toUpperCase();

    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
        children: <Widget>[
          // new JobCard(job,
          //   horizontal: false,
          // ),
          _getBackground(),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Align(
                      child: Text(
                        job['name'].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Duration",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                _date,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Icon(
                                Icons.local_activity,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text("Activity Level",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 10,
                              ),
                              Text(
                                job['name' + "asdfasdf"].toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.attach_money, color: Colors.grey),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Compensation",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                job['salary'].toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: 30,
                              ),
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Hosted In",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(job['name' + "language"].toString(),
                                  style: TextStyle(fontSize: 18)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    ),
                  ]),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Text(
                          "What You'll Do:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 15,
                      ),
                      Align(
                        child:
                            Text(job['description'].toString()),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 20,
                      ),
                      Align(
                        child: Text(
                          "Employee Requirements:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 8,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * .05,
                      0,
                      MediaQuery.of(context).size.width * .05,
                      0),
                ),
                Container(
                  child: Column(
                      children: <Widget>[
                        Text(job.data['requirements'])
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                ),
                Container(
                  alignment: Alignment(0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: RaisedButton(
                    child: Text(
                      "Apply Now",
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 6.0,
                    color: Colors.green,
                    onPressed: () {
                      applyNow(context);
                      inputData(job);
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

void inputData(DocumentSnapshot job) async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final uid = user.uid;

  DocumentReference userReference = Firestore.instance.collection("users").document(uid);

  List<dynamic> applicants = job.data['applicants'];
  bool doesContain = false;
  applicants.forEach((applicant) {
    if (applicant.path == userReference.path){
      doesContain = true;
    }
  });

  if (!doesContain) {
    applicants.add(userReference);
    Firestore.instance
        .collection('listings')
        .document(job.documentID)
        .updateData({"applicants": applicants});

    DocumentSnapshot currentUser = await Firestore.instance
        .collection("users")
        .document(uid.toString())
        .get();

    dynamic currentJobs = currentUser.data['listings'];

    DocumentReference newJob =
        await Firestore.instance.collection("listings").document(job.documentID);

    currentJobs.add(newJob);

    Firestore.instance
        .collection("users")
        .document(uid.toString())
        .updateData({'listings': currentJobs});

    Firestore.instance.collection("listings").document(job.documentID).updateData(
        {"numberOfApplicants": job.data['applicants'].length + 1});

  }


}
