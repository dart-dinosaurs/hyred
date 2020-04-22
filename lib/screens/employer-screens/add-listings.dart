import 'package:flutter/material.dart';
import 'package:main/services/show_dialog.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

var data = [
  {
    "display": "Caregiving",
    "value": "Caregiving",
  },
  {
    "display": "Janitorial",
    "value": "Janitorial",
  },
  {
    "display": "Retail",
    "value": "Retail",
  },
  {
    "display": "Labour",
    "value": "Labour",
  },
  {
    "display": "Construction",
    "value": "Construction",
  },
  {
    "display": "Handyman",
    "value": "Handyman",
  },
  {
    "display": "Freelance",
    "value": "Freelance",
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
  static String name;

  List _listingCategories;
  final formKey = new GlobalKey<FormState>();

  Future<Null> _selectDate(BuildContext context) async {}

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

  next() {
    switch (currentStep) {
      case 0:
    }
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

  List<Step> steps = [
    Step(
      title: const Text('Description'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          Text(
            "Describe your listing!",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(labelText: 'Decription'),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          SizedBox(height: 15),
          Text("What time will this take place?"),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.error,
      title: const Text('Avatar'),
      subtitle: const Text("Error!"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              elevation: 4.0,
                              color: Colors.white,
                              onPressed: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.access_time,
                                                size: 18.0,
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                              Text(
                                                "Not set",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "  Change Start Time",
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              elevation: 4.0,
                              color: Colors.white,
                              onPressed: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.access_time,
                                                size: 18.0,
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                              Text(
                                                "Not set",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Change End Time",
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.all(8),
                            alignment: AlignmentDirectional.center,
                            child: RaisedButton(
                              child: Text('Next Step'),
                              onPressed: () {
                                if (_listingCategories.length > 0 &&
                                    _nameController.toString() != '') {
                                  this.setState(() {
                                    categoriesComplete = true;
                                    name = _nameController.toString();
                                  });
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
              )));
  }
}
