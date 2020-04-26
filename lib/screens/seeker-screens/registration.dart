import 'package:flutter/material.dart';
import 'package:main/models/user.dart';
import 'package:main/services/auth.dart';
import 'package:main/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Registration extends StatefulWidget {
  final VoidCallback setRegister;
  Registration({this.setRegister});
  @override
  _RegistrationState createState() => _RegistrationState();
}


class _RegistrationState extends State<Registration> {
  final _auth = AuthService();
  int currentStep = 0;
  bool complete = false;
  int currentIndex = 0;

  changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    print(currentIndex);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
    widget.setRegister();
    _auth.signOut();
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    var uid = user.uid;
    final _firestore = FirestoreService(uid: uid);
    

    final fnameController = TextEditingController();
    final lnameController = TextEditingController();

    final businessNameController = TextEditingController();
    final addressStreetController = TextEditingController();
    final addressApartmentController = TextEditingController();
    final addressCityController = TextEditingController();
    final addressProvinceController = TextEditingController();
    final addressPostalCodeController = TextEditingController();

    @override
    void dispose() {
      fnameController.dispose();
      lnameController.dispose();

      businessNameController.dispose();
      addressStreetController.dispose();
      addressApartmentController.dispose();
      addressCityController.dispose();
      addressProvinceController.dispose();
      addressPostalCodeController.dispose();
      super.dispose();
    }

    List<Step> steps = [
      Step(
        title: Text("Basic Information"),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "I am a:",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ToggleSwitch(
              minWidth: 150.0,
              initialLabelIndex: 0,
              activeBgColor: Colors.blue,
              activeTextColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveTextColor: Colors.grey[900],
              labels: ['Job-seeker', 'Employer'],
              onToggle: (index) {
                changeIndex(index);
              },
            ),
            SizedBox(height: 15),
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
        title: currentIndex == 0 ? Text("Address") : Text("Business Address"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          children: <Widget>[
            currentIndex == 1
                ? TextFormField(
                    controller: businessNameController,
                    decoration: InputDecoration(labelText: 'Business Name'),
                  )
                : SizedBox(),
            TextFormField(
              controller: addressStreetController,
              decoration: InputDecoration(labelText: 'Street Address'),
            ),
            TextFormField(
              controller: addressApartmentController,
              decoration: InputDecoration(labelText: 'Apartment, suite, etc'),
            ),
            TextFormField(
              controller: addressCityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(
              child: Row(children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: addressProvinceController,
                    decoration: InputDecoration(labelText: 'Province'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: addressPostalCodeController,
                    decoration: InputDecoration(labelText: 'Postal Code'),
                  ),
                ),
              ]),
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

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Error"),
            content: new Text("Form fields musn't be empty!"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    next() {
      switch (currentStep) {
        case 0:
          if (fnameController.text == "" || lnameController.text == "") {
            _showDialog();
            return;
          }
          _firestore.registerBasicInformation(
              fnameController.text, lnameController.text, currentIndex == 1);
          break;
        case 1:
          if (currentIndex == 1 && businessNameController.text == "") {
            _showDialog();
            return;
          } else if (currentIndex == 1) {
            _firestore.registerBusinessName(businessNameController.text);
          }
          if (addressPostalCodeController.text == "" ||
              addressCityController.text == "" ||
              addressStreetController.text == "" ||
              addressProvinceController.text == "") {
            _showDialog();
            return;
          }
          _firestore.registerAddress(addressStreetController.text, 
                                    addressApartmentController.text, 
                                    addressCityController.text, 
                                    addressProvinceController.text, 
                                    addressPostalCodeController.text);
          break;
      }
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : () {
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
