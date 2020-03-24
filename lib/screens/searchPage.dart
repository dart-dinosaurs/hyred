import 'package:flutter/material.dart';
import 'package:main/screens/widgets/jobCard.dart';
import '../screens/widgets/data.dart';

class SearchPage extends StatelessWidget {
  @override

  final String value;

  SearchPage(this.value);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Jobs"),
        backgroundColor: Theme.of(context).accentColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<Job> {

  final cities = topJobs;

  final recentCities = topJobs;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
      color: Colors.red,
      child: Center(),
      
    )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty ? recentCities : cities.where((p)=>(p.name.startsWith((query)) || p.employer.startsWith(query))).toList();
    
    return ListView.builder(
      // itemBuilder: (context, index) => ListTile(
      //   onTap: (){
      //     showResults(context);
      //   },
      //   leading: Icon(Icons.location_city),
      //   title: RichText(text: TextSpan(
      //     text: suggestionsList[index].name.substring(0, query.length),
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //     children: [TextSpan(
      //       text: suggestionsList[index].name.substring(query.length),
      //       style: TextStyle(color: Colors.grey)
      //     )]
      //   )),
      // ),
      itemBuilder: (context, index) => JobCard(suggestionsList[index]),
      itemCount: suggestionsList.length,
    );
  }
}
