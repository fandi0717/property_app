import 'package:flutter/material.dart';
import 'package:property_app/routes/app_route.dart';

class RootTreeScreen extends StatelessWidget {
  RootTreeScreen({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Property App",
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 245, 245, 245)),
    );
  }
}
