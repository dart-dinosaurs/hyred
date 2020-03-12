import 'package:flutter/material.dart';
import 'package:main/screens/widgets/placeholder.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  List<Step> steps = [
    Step(
      title: Text("Basic Information"),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
              decoration: InputDecoration(labelText: 'Legal Family Name')),
          TextFormField(
              decoration: InputDecoration(labelText: 'Legal Given Name'))
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
              decoration: InputDecoration(labelText: 'Street Address')),
          TextFormField(
              decoration: InputDecoration(labelText: 'Apartment, suite, etc')),
          TextFormField(
              decoration: InputDecoration(labelText: 'City')),
          TextFormField(
              decoration: InputDecoration(labelText: 'Apartment, suite, etc'))
        ],
      ),
    ),
  ];

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Account Details'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(steps: steps,
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
