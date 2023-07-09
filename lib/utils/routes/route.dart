import 'package:flutter/material.dart';
import 'package:safewheel/ui/List_screen.dart';
import 'package:safewheel/utils/routes/routes_name.dart';

import '../../ui/Details_screen.dart';
import '../../ui/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.list:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ListScreen());
      // case RoutesName.details:
      //   return MaterialPageRoute(builder: (BuildContext context) =>  const DetailsScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('404 Page'),
            ),
          );
        });
    }
  }
}
