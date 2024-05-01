import 'package:flutter/material.dart';
import 'package:property_app/core/bottom_navigation_bar/widgets/bottom_navigation_bar_widget.dart';

class BuildingScreen extends StatelessWidget {
  const BuildingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Building Screen"),
      ),
      bottomNavigationBar: bottomNavigationBarWidget(context),
    );
  }
}
