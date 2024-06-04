import 'package:flutter/material.dart';

import '../features/account/presentation/screens/account_screen.dart';
import '../features/building/presentation/building_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/document/presentation/screens/document_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'route_name.dart';

class AppRouter {
  String lastRoute = "";
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.HOME:
        if (lastRoute != RouteName.HOME) {
          lastRoute = RouteName.HOME;
          return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
              settings: routeSettings);
        }
        break;

      case RouteName.BUILDING:
        if (lastRoute != RouteName.BUILDING) {
          lastRoute = RouteName.BUILDING;
          return MaterialPageRoute(
              builder: (context) => const BuildingScreen(),
              settings: routeSettings);
        }
        break;

      case RouteName.DOCUMENTS:
        if (lastRoute != RouteName.DOCUMENTS) {
          lastRoute = RouteName.DOCUMENTS;
          return MaterialPageRoute(
              builder: (context) => const DocumentScreen(),
              settings: routeSettings);
        }
        break;

      case RouteName.CART:
        if (lastRoute != RouteName.CART) {
          lastRoute = RouteName.CART;
          return MaterialPageRoute(
              builder: (context) => const CartScreen(),
              settings: routeSettings);
        }
        break;
      case RouteName.ACCOUNT:
        if (lastRoute != RouteName.ACCOUNT) {
          lastRoute = RouteName.ACCOUNT;
          return MaterialPageRoute(
              builder: (context) => const AccountScreen(),
              settings: routeSettings);
        }
        break;
    }
    return null;
  }
}
