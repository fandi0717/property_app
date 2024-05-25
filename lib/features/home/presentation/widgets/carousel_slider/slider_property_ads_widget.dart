// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;

class SliderPropertyAdsWidget extends StatelessWidget {
  const SliderPropertyAdsWidget(
      {super.key,
      required this.diskon,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.backgroundColor,
      this.imgPath = "assets/images/american_house.png"});

  final double diskon;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final Color backgroundColor;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// [information]
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              // padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "${diskon.toInt()}%",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: f.Rubix,
                              height: 21.33 / 18,
                              color: c.RGB255_O1),
                          children: const [
                        TextSpan(
                            text: ' ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                height: 18.9 / 15,
                                fontFamily: f.Outfit,
                                color: c.RGB255_O1)),
                        TextSpan(
                            text: "Diskon",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                height: 18.9 / 15,
                                fontFamily: f.Outfit,
                                color: c.RGB255_O1))
                      ])),
                  const Gap(7),
                  AutoSizeText(
                    name,
                    minFontSize: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 25.2 / 20,
                        color: c.RGB255_O1,
                        fontFamily: f.Outfit),
                    maxLines: 1,
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/utils/svg/calendar.svg'),
                      const Gap(5),
                      Expanded(
                        child: AutoSizeText(
                          "\tPeriode ${DateFormat('d MMM yyyy', 'id').format(startDate)} s/d ${DateFormat('d MMM yyyy', 'id').format(endDate)}",
                          maxLines: 1,
                          minFontSize: 1,
                          style: const TextStyle(
                              color: c.RGB255_O1,
                              fontFamily: f.Outfit,
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              height: 12.6 / 10),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          /// [img]
          Align(
            alignment: Alignment.bottomRight,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                imgPath,
                scale: 0.5,
                // scale: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
