import 'package:main/screens/employer-screens/add_listings.dart';
import 'package:main/screens/employer-screens/home.dart';
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
    ]);
  }
}
