import 'package:flutter/material.dart';
import 'package:main/screens/widgets/placeholder.dart';

class EmployerHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployerHomeState();
  }
}

class _EmployerHomeState extends State<EmployerHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.pink),
    PlaceholderWidget(Colors.purple),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.red),
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
