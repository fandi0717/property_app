import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
                    color: Color.fromRGBO(106, 139, 146, 1),
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile_avatar.png"))),
              ),
              const Gap(10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Temukan\nHunian Impian",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromARGB(255, 51, 74, 52),
                        fontFamily: 'Outfit'),
                  ),
                  Gap(4),
                  Text(
                    "Agen Properti Terbaik",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        color: Color.fromARGB(255, 126, 126, 126)),
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
                    color: Colors.white,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    fontSize: 10.67),
              ),
            ),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromARGB(255, 255, 92, 92),
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
              color: Colors.white,
              shape: BoxShape.circle,
            ),

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
