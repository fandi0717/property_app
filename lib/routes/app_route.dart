import 'package:flutter/material.dart';

import '../features/account/presentation/screens/account_screen.dart';
import '../features/building/presentation/building_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/document/presentation/screens/document_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'route_name.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    return PageRouteBuilder(
      settings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (routeSettings.name) {
          case RouteName.HOME:
            return const HomeScreen();

          case RouteName.BUILDING:
            return const BuildingScreen();

          case RouteName.DOCUMENTS:
            return const DocumentScreen();

          case RouteName.CART:
            return const CartScreen();

          case RouteName.ACCOUNT:
            return const AccountScreen();

          default:
            return Container();
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
      /* [OPTIONAL] TRANSITION
        Anda bisa mengubah transisi di sini
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.elasticIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
        */
        return child;
      },
    );
  }
}
