import 'package:flutter/material.dart';
import 'widgets/placeholder.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.red),
    PlaceholderWidget(Colors.pink),
    PlaceholderWidget(Colors.purple),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.yellowAccent),
  ];

  Widget getWidget(int index) {
    return _children[index];
  }

  void onTabTapped(int index) {
   if(index < _children.length){
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
          data: Theme.of(context).copyWith(canvasColor: Colors.blue),
          child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex, 
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.assignment),
                    title: new Text("Explore")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.search),
                    title: new Text("Search")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.message),
                    title: new Text("Messages")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.library_books),
                    title: new Text("History")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.person),
                    title: new Text("Profile")),
              ]),
        ));
  }
}