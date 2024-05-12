import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'routes/app_route.dart';

class RootTreeScreen extends StatelessWidget {
  RootTreeScreen({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "Property App",
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 245, 245, 245),
          textTheme: const TextTheme(
              labelSmall: TextStyle(
                  color: Color.fromARGB(255, 51, 74, 52),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400))),
    );
  }
}
