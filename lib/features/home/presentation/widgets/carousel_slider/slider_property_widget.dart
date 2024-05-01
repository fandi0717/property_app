// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// [information]
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "${diskon.toInt()}% ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: const [
                        TextSpan(
                            text: "Diskon\n",
                            style: TextStyle(fontWeight: FontWeight.normal))
                      ])),
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 10,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          "\tPeriode ${DateFormat('d MMM yyyy', 'id').format(startDate)} s/d ${DateFormat('d MMM yyyy', 'id').format(endDate)}",
                          maxLines: 1,
                          minFontSize: 1,
                          style: const TextStyle(color: Colors.white),
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
