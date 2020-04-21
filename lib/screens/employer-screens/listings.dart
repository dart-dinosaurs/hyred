import 'package:flutter/material.dart';
import 'package:main/router.dart';
import 'package:main/screens/widgets/search_bar.dart';

class ListingsScreen extends StatefulWidget {
  @override
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  TextEditingController _controller = TextEditingController();
  String _search;
  
  void changeSearch(String value){
    this.setState(() => {_search=value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: (){
          Router.sailor.navigate('/employer/add');
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(controller: _controller, onChange: this.changeSearch,),
          ],
        ),
      ),
    );
  }
}
