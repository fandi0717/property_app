import 'package:flutter/material.dart';
import 'package:property_app/features/building/presentation/building_screen.dart';
import 'package:property_app/routes/route_name.dart';

import '../features/home/presentation/screens/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: routeSettings);

      case RouteName.BUILDING:
        return MaterialPageRoute(
            builder: (context) => const BuildingScreen(),
            settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: routeSettings);
    }
  }
}
