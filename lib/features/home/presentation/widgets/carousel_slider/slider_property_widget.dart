// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class SliderPropertyWidget extends StatelessWidget {
  const SliderPropertyWidget(
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
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "${diskon.toInt()}% ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'Rubik',
                              color: Colors.white),
                          children: const [
                        TextSpan(
                            text: "Diskon",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                fontFamily: 'Outfit',
                                color: Colors.white))
                      ])),
                  const Gap(7),
                  AutoSizeText(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Outfit'),
                    maxLines: 1,
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/utils/svg/calendar.svg'),
                      Expanded(
                        child: AutoSizeText(
                          "\tPeriode ${DateFormat('d MMM yyyy', 'id').format(startDate)} s/d ${DateFormat('d MMM yyyy', 'id').format(endDate)}",
                          maxLines: 1,
                          minFontSize: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w300,
                              fontSize: 10),
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
