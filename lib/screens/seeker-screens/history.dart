import 'package:flutter/material.dart';
import 'package:main/screens/widgets/data.dart';
import 'package:main/screens/widgets/historyCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/screens/widgets/jobCard.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    var jobs = Provider.of<QuerySnapshot>(context);

    List<DocumentSnapshot> _widgets = jobs.documents.where((doc) => doc.data['jobDetails']['name'].contains('Cashier')).toList();
    List<Widget> _actual = _widgets.map((doc) => HistoryCard(doc)).toList();

    
    return(
      ListView(children: _actual)
    );
  }
}