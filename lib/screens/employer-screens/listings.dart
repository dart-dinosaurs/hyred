import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class ListingsScreen extends StatefulWidget {
  @override
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  FocusNode _searchFocus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocus = FocusNode();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_searchFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                focusNode: _searchFocus,
                onTap: _requestFocus,
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(
                      color: _searchFocus.hasFocus
                          ? Theme.of(context).accentColor
                          : Colors.grey),
                  hintText: "Search anything here!",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: _searchFocus.hasFocus
                          ? Theme.of(context).accentColor
                          : Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
