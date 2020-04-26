import 'package:flutter/material.dart';
import 'package:main/screens/employer-screens/add-listings.dart';
import 'package:main/screens/employer-screens/home.dart';
import 'package:main/screens/widgets/terms.dart';
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
        name: '/construction',
        builder: (context, args, params) {
          return Scaffold(body: Construction());
        },
      ),
      SailorRoute(
        name: '/terms',
        builder: (context, args, params) {
          return Scaffold(body: Terms());
        },
      ),
    ]);
  }
}
