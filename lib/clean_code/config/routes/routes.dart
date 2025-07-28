import 'package:bloc_learning/clean_code/config/routes/routes_name.dart';

import 'package:flutter/material.dart';

import '../../views/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );

    }
  }
}