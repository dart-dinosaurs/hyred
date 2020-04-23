import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/models/user.dart';
import 'package:main/screens/widgets/loading.dart';
import 'package:main/services/firestore.dart';
import 'package:main/services/show_dialog.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:main/screens/widgets/date_time_picker.dart';
import 'package:main/screens/widgets/time_picker.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

var data = [
  {
    "display": "Caregiving",
    "value": "caregiving",
  },
  {
    "display": "Janitorial",
    "value": "janitorial",
  },
  {
    "display": "Retail",
    "value": "retail",
  },
  {
    "display": "Labour",
    "value": "labour",
  },
  {
    "display": "Construction",
    "value": "construction",
  },
  {
    "display": "Handyman",
    "value": "handyman",
  },
  {
    "display": "Freelance",
    "value": "freelance",
  },
];

class AddListingsScreen extends StatefulWidget {
  @override
  _AddListingsScreenState createState() => _AddListingsScreenState();
}

class _AddListingsScreenState extends State<AddListingsScreen> {
  int currentStep = 0;
  bool complete = false;
  bool categoriesComplete = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  static String name;

  final Map<String, dynamic> listing = {};

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _requirementsController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  List _listingCategories;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _listingCategories = [];
  }

  setCategories(List categories) {
    this.setState(() {
      _listingCategories = categories;
    });
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  DateTime _date;
  TimeOfDay _begin;
  TimeOfDay _end;

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    print(user.uid);

    next() {
      switch (currentStep) {
        case 0:
          if (_descriptionController.text == "") {
            ShowDialog.error(context);
            return;
          }
          listing["description"] = _descriptionController.text;
          break;
        case 1:
          if (_requirementsController.text == "") {
            ShowDialog.error(context);
            return;
          }
          listing["requirements"] = _requirementsController.text;
          break;
        case 2:
          if (_salaryController.text == "") {
            ShowDialog.error(context);
            return;
          } else if (double.tryParse(_salaryController.text) == null) {
            ShowDialog.custom(context, "Invalid", "Salary must be a number!");
            return;
          } else if (double.tryParse(_salaryController.text) < 14.25) {
            ShowDialog.custom(
                context, "Invalid", "Salary must be greater than 14.25!");
          }
          listing["salary"] = double.tryParse(_salaryController.text);
          print(listing);
          FirestoreService(uid: user.uid).addListing(listing);
          break;
      }
      currentStep + 1 != 3
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }

    List<Step> steps = [
      Step(
        title: const Text('Description'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Describe your listing! What kind of job is this?",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.multiline,
              controller: _descriptionController,
              maxLines: null,
              maxLength: 200,
            ),
          ],
        ),
      ),
      Step(
        isActive: true,
        state: StepState.editing,
        title: const Text('Requirements'),
        content: Column(
          children: <Widget>[
            Text(
              "What skills must the ideal candidate possess?",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Requirements'),
              keyboardType: TextInputType.multiline,
              controller: _requirementsController,
              maxLines: null,
              maxLength: 200,
            ),
          ],
        ),
      ),
      Step(
        state: StepState.indexed,
        isActive: true,
        title: const Text('Salary'),
        content: Column(
          children: <Widget>[
            Text(
              "How much will you pay?",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Hourly Wage'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _salaryController,
              maxLength: 6,
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your listing"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: categoriesComplete
          ? Column(
              children: <Widget>[
                Expanded(
                  child: Stepper(
                    steps: steps,
                    type: StepperType.horizontal,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) => goTo(step),
                    onStepCancel: cancel,
                  ),
                ),
              ],
            )
          : (Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          "Lets begin by giving your listing a name!",
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          controller: _nameController,
                          autocorrect: false,
                          decoration:
                              InputDecoration(labelText: 'Listing Name'),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "While you're at it, select some categorie(s) that best describe your listing!",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: MultiSelectFormField(
                            autovalidate: false,
                            titleText: 'Listing Categories',
                            validator: (value) {
                              if (value == null || value.length == 0) {
                                return 'Please select one or more options';
                              }
                              return null;
                            },
                            dataSource: data,
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'DONE',
                            cancelButtonLabel: 'CANCEL',
                            required: true,
                            hintText: 'Please choose one or more',
                            value: _listingCategories,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                _listingCategories = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "When will this job take place?",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        DateTimePicker(
                          labelText: "Change Begin Time",
                          onFinish: (DateTime date, TimeOfDay time) {
                            this.setState(() {
                              _date = date;
                              _begin = time;
                            });
                          },
                        ),
                        TimePicker(
                          onFinish: (TimeOfDay time) {
                            this.setState(() {
                              _end = time;
                            });
                          },
                          labelText: "Change End Time",
                          disabled: () {
                            return _date == null;
                          },
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.all(8),
                          alignment: AlignmentDirectional.center,
                          child: RaisedButton(
                            child: Text('Next Step'),
                            onPressed: () {
                              if (_listingCategories.length > 0 &&
                                  _nameController.text != '' &&
                                  _date != null &&
                                  _begin != null &&
                                  _end != null) {
                                if ((_date.month == DateTime.now().month &&
                                            _date.year == DateTime.now().year &&
                                            _date.day == DateTime.now().day) &&
                                        (_begin.hour == TimeOfDay.now().hour &&
                                            _begin.minute <
                                                TimeOfDay.now().minute) ||
                                    (_begin.hour < TimeOfDay.now().hour)) {
                                  ShowDialog.custom(context, "Error",
                                      "Begin time must be in the future!");
                                } else if (_begin.hour == _end.hour &&
                                    _begin.minute < _end.minute) {
                                  ShowDialog.custom(context, "Error",
                                      "End time must be after start time!");
                                } else if (_begin.hour > _end.hour) {
                                  ShowDialog.custom(context, "Error",
                                      "End time must be after start time!");
                                } else {
                                  this.setState(() {
                                    categoriesComplete = true;
                                    name = _nameController.toString();
                                  });
                                  listing["beginTime"] = DateTime(
                                      _date.year,
                                      _date.month,
                                      _date.day,
                                      _begin.hour,
                                      _begin.minute);
                                  listing["endTime"] = DateTime(
                                      _date.year,
                                      _date.month,
                                      _date.day,
                                      _end.hour,
                                      _end.minute);
                                  listing["categories"] = _listingCategories;
                                  listing["name"] = _nameController.text;
                                  print(
                                      "Begin Time ${DateTime(_date.year, _date.month, _date.day, _begin.hour, _begin.minute).toString()}");
                                  print(
                                      "End Time ${DateTime(_date.year, _date.month, _date.day, _end.hour, _end.minute).toString()}");
                                  print(
                                      "Selected Categores ${_listingCategories.toString()}");
                                  print(
                                      "Selected Name: ${_nameController.text}");
                                }
                              } else {
                                ShowDialog.error(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}
