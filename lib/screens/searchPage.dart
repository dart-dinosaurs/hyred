import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Jobs"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {},)
        ],
      ),
    );
  }
}