import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/screens/widgets/image_capture.dart';
import 'package:main/screens/widgets/placeholder.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:main/services/auth.dart';
import 'package:main/services/firestore.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  final VoidCallback setRegister;
  Registration({this.setRegister});
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int currentStep = 0;
  bool complete = false;

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    var uid = user.uid;
    final _firestore = FirestoreService(uid: uid);
    final _auth = AuthService();

    final fnameController = TextEditingController();
    final lnameController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      fnameController.dispose();
      lnameController.dispose();
      super.dispose();
    }

    List<Step> steps = [
      Step(
        title: Text("Basic Information"),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            TextFormField(
                controller: fnameController,
                decoration: InputDecoration(labelText: 'Legal Family Name')),
            TextFormField(
                controller: lnameController,
                decoration: InputDecoration(labelText: 'Legal Given Name')),
          ],
        ),
      ),
      Step(
        title: Text("Address"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Street Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Apartment, suite, etc'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'City'),
            ),
          ],
        ),
      ),
      Step(
        title: Text("Upload your ID"),
        content: Column(children: <Widget>[
          Text("Select your ID"),
        ]),
        state: StepState.indexed,
        isActive: true,
      ),
    ];

    next() {
      switch (currentStep) {
        case 0:
          _firestore.registerName(fnameController.text, lnameController.text);
          break;
        default:
      }
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : (){
              _firestore.onUserFinishRegister();
              widget.setRegister();
              _auth.signOut();
            }();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Account Details'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          )
        ],
      ),
    );
  }
}
