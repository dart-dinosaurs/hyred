import 'package:main/screens/employer-screens/add_listings.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/employer-screens/home.dart';
import 'package:main/screens/widgets/listing_detail.dart';
import 'package:main/screens/widgets/under_construction.dart';
import 'package:sailor/sailor.dart';

class Router {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: '/employer',
        builder: (context, args, params) {
          return EmployerHome();
        },
      ),
      SailorRoute(
        name: '/employer/add',
        builder: (context, args, params) {
          return AddListingsScreen();
        },
      ),
      SailorRoute(
        name: '/employer/edit',
        builder: (context, args, params) {
          return EmployerHome();
        },
      ),
      SailorRoute(
        name: '/employer/listing_detail',
        builder: (context, args, params) {
          return ListingDetail(name: params.param<String>("name"));
        },
        params: [
          SailorParam(name: 'name', isRequired: true),
        ],
      ),
      SailorRoute(
        name: '/construction',
        builder: (context, args, params) {
          return Scaffold(body: Construction());
        },
      ),
    ]);
  }
}
