import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              /*
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile_avatar.png"),
              ),
              */
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: c.R106_G139_B146_O1,
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile_avatar.png"))),
              ),
              const Gap(10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Temukan\nHunian Impian",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: c.R51_G74_B52_O1,
                        fontFamily: f.Outfit),
                  ),
                  Gap(4),
                  Text(
                    "Agen Properti Terbaik",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: f.Outfit,
                        color: c.RGB126_O1),
                  )
                ],
              )
            ],
          ),
        ),
        badges.Badge(
          badgeContent: const Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Center(
              child: Text(
                "3",
                style: TextStyle(
                    color: c.RGB255_O1,
                    fontFamily: f.Outfit,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.67),
              ),
            ),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: c.R255_G92_B92_O1,
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          ),

          /*
          child: CircleAvatar(
              backgroundColor: Colors.white,
              // radius: 20,
              // child: SvgPicture.asset(
              //   'assets/icons/utils/svg/notification.svg',
              //   // width: 20,
              //   // height: 20,
              // ),
              child: Icon(
                Icons.notifications,
                size: 35,
                color: Color.fromARGB(255, 51, 74, 52),
              )),
          */

          child: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
                color: c.RGB255_O1,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 11,
                      offset: Offset(0, 5),
                      color: c.R197_G209_B198_O016)
                ]),

            /*
            child: const Icon(
              Icons.notifications,
              size: 20,
              color: Color.fromARGB(255, 51, 74, 52),
            ),
            */

            child: Center(
              child: SvgPicture.asset(
                'assets/icons/utils/svg/notification.svg',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
