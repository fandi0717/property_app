import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:property_app/app.dart';
import 'package:property_app/features/home/logic/bloc/home_bloc.dart';

void main() async {
  await initializeDateFormatting("id", null);
  runApp(const PropertyApp());
}

class PropertyApp extends StatelessWidget {
  const PropertyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      )
    ], child: RootTreeScreen());
  }
}
