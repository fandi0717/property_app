import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:device_preview/device_preview.dart';

import 'app.dart';
import 'core/bottom_navigation_bar/cubit/bottom_navigation_bar_cubit.dart';
import 'features/home/logic/bloc/home_bloc.dart';

/// TODO : IMPLEMENT TEXTSTYLE : FONTSIZE, FONTFAMILY, FONTWEIGHT, COLOR, ETC
/// TODO : IMPLEMENT SPLASH SCREEN & ICON APP
///
/// 1. Outfit
/// 2. Rubik
/// 3. Lexend
///
/// TODO : IMPLEMENT SHADOW OR BACKGROUND SHADOW IN CONTAINER
void main() async {
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
