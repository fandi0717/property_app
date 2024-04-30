import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/images/profile_avatar.png"),
      ),
      title: Text(
        "Temukan\nHunian Impian",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Agen Properti Terbaik"),
      trailing: badges.Badge(
        badgeContent: Text(
          "3",
          style: TextStyle(color: Colors.white),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          // radius: 25,
          child: Icon(Icons.notifications),
        ),
      ),
    );
  }
}
