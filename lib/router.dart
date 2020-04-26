import 'package:main/screens/employer-screens/add_listings.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/employer-screens/home.dart';
import 'package:main/screens/widgets/listing_detail.dart';
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
        name: '/employer/listing_detail',
        builder: (context, args, params) {
          return ListingDetail(
            name: params.param("name"),
            categories: params.param("categories"),
            applicants: params.param("applicants"),
            salary: params.param("salary"),
            reference: params.param("reference"),
          );
        },
        params: [
          SailorParam(name: 'name', isRequired: true),
          SailorParam(name: 'categories', isRequired: true),
          SailorParam(name: 'applicants', isRequired: true),
          SailorParam(name: 'salary', isRequired: true),
          SailorParam(name: 'reference', isRequired: true)
        ],
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
