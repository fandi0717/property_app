import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'core/bottom_navigation_bar/cubit/bottom_navigation_bar_cubit.dart';
import 'features/home/logic/bloc/home_bloc.dart';

/// [Fonts]
/// 1. Outfit
/// 2. Rubik
/// 3. Lexend
/// TODO : IMPLEMENT SHADOW OR BACKGROUND SHADOW IN CONTAINER

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDateFormatting("id", null);
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const PropertyApp()));
}

class PropertyApp extends StatelessWidget {
  const PropertyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(
        create: (context) => BottomNavigationBarCubit(),
      )
    ], child: RootTreeScreen());
  }
}
