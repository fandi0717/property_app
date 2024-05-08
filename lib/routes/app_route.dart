import 'package:flutter/material.dart';

import '../features/account/presentation/screens/account_screen.dart';
import '../features/building/presentation/building_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/document/presentation/screens/document_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'route_name.dart';

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
      case RouteName.DOCUMENTS:
        return MaterialPageRoute(
            builder: (context) => const DocumentScreen(),
            settings: routeSettings);
      case RouteName.CART:
        return MaterialPageRoute(
            builder: (context) => const CartScreen(), settings: routeSettings);
      case RouteName.ACCOUNT:
        return MaterialPageRoute(
            builder: (context) => const AccountScreen(),
            settings: routeSettings);
    }
    return null;
  }
}
