import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/seeker-screens/history.dart';
import 'package:main/screens/seeker-screens/historyDetails.dart';
import 'package:main/screens/widgets/placeholder.dart';
import 'package:main/screens/seeker-screens/Newexplore.dart';
import 'package:main/screens/seeker-screens/settings.dart';
import 'package:provider/provider.dart';
import 'package:main/models/user.dart';
import 'package:main/services/firestore.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class ExploreWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: FirestoreService(uid: user.uid).jobData,
      child: NewExplore(),
    );
  }
}

class HistoryWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: FirestoreService(uid: user.uid).jobData,
      child: History(),
    );
  }
}



class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ExploreWrapper(),
    PlaceholderWidget(Colors.purple),
    PlaceholderWidget(Colors.purple),
    HistoryWrapper(),
    Settings(),
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
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Theme.of(context).accentColor),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.assignment),
                    title: new Text("Explore")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.search), title: new Text("Search")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.message), title: new Text("Messages")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.library_books),
                    title: new Text("History")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.person), title: new Text("Profile")),
              ]),
        ));
  }
}
