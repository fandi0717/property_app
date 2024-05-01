import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile_avatar.png"),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Temukan\nHunian Impian",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Agen Properti Terbaik",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
        badges.Badge(
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
      ],
    );
  }
}
