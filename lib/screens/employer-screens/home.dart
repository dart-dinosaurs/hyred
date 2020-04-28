import 'package:flutter/material.dart';
import 'package:main/screens/employer-screens/listings.dart';
import 'package:main/screens/employer-screens/profile.dart';
import 'package:main/screens/widgets/under_construction.dart';
import 'profile.dart';

class EmployerHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployerHomeState();
  }
}

class _EmployerHomeState extends State<EmployerHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListingsScreen(),
    Construction(),
    Profile(),
  ];

  Widget getWidget(int index) {
    return _children[index];
  }

  void onTabTapped(int index) {
    if (index < _children.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getWidget(_currentIndex),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Theme.of(context).accentColor),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.assignment),
                  title: new Text("Listings"),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.message),
                  title: new Text("Messages"),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person),
                  title: new Text("Profile"),
                ),
              ]),
        ));
  }
}
