import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class HistoryCard extends StatelessWidget {
  

  final DocumentSnapshot job;

  HistoryCard(this.job);

  @override
  Widget build(BuildContext context) {
    
    return Container(
        height: 120,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // ClipRRect(
                //   borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(20),
                //       bottomLeft: Radius.circular(20),
                //       topRight: Radius.circular(0),
                //       bottomRight: Radius.circular(0)),
                //   child: Image(
                //       image: new NetworkImage(job['image']),
                //       height: 120,
                //       width: 150,
                //       fit: BoxFit.cover),
                // ),
                
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Text(
                        job['jobDetails']['name'].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                      Container(
                        height: 10,
                      ),
                      Container(
                          child: Text(
                        "Posted by: ", //+ job['employer'],
                        textAlign: TextAlign.left,
                      )),
                      Container(
                        height: 10,
                      ),
                      //Container(child: Text(job['name'])),
                      Container(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Status: ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 20,
                          )
                        ],
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
