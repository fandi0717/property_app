import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// [HEAD]
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Row(
                    children: [
                      CircleAvatar(),
                      Column(
                        children: [
                          Text(
                            "Temukan\nHunian Impian",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Agen Properti Terbaik")
                        ],
                      ),
                    ],
                  ),
                ),

                /// [Badge]
                const badges.Badge(
                  badgeContent: Text("3"),
                  child: Icon(Icons.notifications),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
