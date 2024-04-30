import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/app.dart';
import 'package:property_app/features/home/logic/bloc/home_bloc.dart';

/// TODO : https://31sudirmansuites.com/apa-saja-contoh-investasi-properti/
/// MACAM - MACAM PROPERTI :
/// 1. RESIDENTIAL PROPERTY
/// 2. COMMERCIAL PROPERTY
/// 3. INDUSTRIAL PROPERTY

void main() {
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
