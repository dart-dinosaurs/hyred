import 'package:flutter/material.dart';

class ListingDetail extends StatefulWidget {
  String name;

  ListingDetail({@required this.name});

  @override
  _ListingDetailtate createState() => _ListingDetailtate();
}

class _ListingDetailtate extends State<ListingDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name),
    );
  }
}