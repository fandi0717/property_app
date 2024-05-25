import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../core/formatting/indonesia.dart';
import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;
import '../../../data/models/property.dart';
import '../../../logic/bloc/home_bloc.dart';

class SliderPropertyOrderWidget extends StatelessWidget {
  const SliderPropertyOrderWidget(
      {super.key,
      required this.propertys,
      required this.indexOrder,
      required this.controller});

  final List<Property> propertys;
  final int indexOrder;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        carouselController: controller,
        itemCount: propertys.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            // height: 100,
            decoration: BoxDecoration(
                color: c.RGB255_O1, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                /// [id] & [jenisProperty]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#${propertys[index].id}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 15.12 / 12,
                          fontFamily: f.Outfit,
                          color: c.R51_G74_B52_O1),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: c.R154_G202_B62_O1,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      // height: MediaQuery.of(context).size.height * 0.2,
                      // width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          propertys[index].jenisProperty,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 15.12 / 12,
                              fontFamily: f.Outfit,
                              color: c.RGB255_O1),
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(10),

                /// [img, information]
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.3),
                        child: AspectRatio(
                          aspectRatio: 100 / 85,
                          child: Image.asset(
                            propertys[index].imgPath,
                            // scale: 6,
                            // width: 100,
                            // height: 85,
                            fit: BoxFit.cover,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) return child;
                              return AnimatedOpacity(
                                opacity: frame == null ? 0 : 1,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeOut,
                                child: child,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/utils/svg/home.svg',
                                width: 14,
                                height: 14,
                                colorFilter: const ColorFilter.mode(
                                    c.R51_G74_B52_O1, BlendMode.srcIn),
                              ),
                              const Gap(5),
                              Expanded(
                                child: AutoSizeText(
                                  propertys[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 15.12 / 12,
                                      fontFamily: f.Outfit,
                                      color: c.R51_G74_B52_O1),
                                  maxLines: 1,
                                  minFontSize: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          const Gap(7),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/utils/svg/location.svg',
                                width: 14,
                                height: 14,
                                colorFilter: const ColorFilter.mode(
                                    c.R51_G74_B52_O1, BlendMode.srcIn),
                              ),
                              const Gap(5),
                              Expanded(
                                // width: MediaQuery.of(context).size.width * 0.4,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: AutoSizeText(
                                    propertys[index].location,

                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 15.12 / 12,
                                        fontFamily: f.Outfit,
                                        color: c.R51_G74_B52_O1),

                                    maxLines: 1,
                                    // minFontSize: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Gap(7),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/utils/svg/date.svg',
                                colorFilter: const ColorFilter.mode(
                                    c.R51_G74_B52_O1, BlendMode.srcIn),
                                width: 14,
                                height: 14,
                              ),
                              const Gap(5),
                              Expanded(
                                child: AutoSizeText(
                                  DateFormat('dd/MM/yyyy, HH:mm')
                                      .format(propertys[index].dateTarget),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 15.12 / 12,
                                      fontFamily: f.Outfit,
                                      color: c.R51_G74_B52_O1),
                                  maxLines: 1,
                                  minFontSize: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          const Gap(7),
                          AutoSizeText.rich(
                            TextSpan(
                                text: 'Rp',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: f.Outfit,
                                    color: c.R51_G74_B52_O1,
                                    height: 15.12 / 12),
                                children: [
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: f.Outfit,
                                          fontWeight: FontWeight.w500,
                                          color: c.R51_G74_B52_O1,
                                          height: 17.64 / 14)),
                                  TextSpan(
                                    text:
                                        rupiah(propertys[index].price.toInt()),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        height: 17.64 / 14,
                                        fontFamily: f.Outfit,
                                        color: c.R51_G74_B52_O1),
                                  )
                                ]),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 1,
                            textAlign: TextAlign.right,
                          ),

                          // [Alternatif]
                          /* 
                          Row(
                            children: [
                              const Text(
                                "Rp",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: f.Outfit,
                                    color: c.R51_G74_B52_O1,
                                    height: 15.12 / 12),
                              ),
                              const Text(" ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: f.Outfit,
                                      fontWeight: FontWeight.w500,
                                      color: c.R51_G74_B52_O1,
                                      height: 17.64 / 14)),
                              // const Gap(5),
                              Expanded(
                                child: AutoSizeText(
                                  rupiah(propertys[index].price.toInt()),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      height: 17.64 / 14,
                                      fontFamily: f.Outfit,
                                      color: c.R51_G74_B52_O1),
                                  maxLines: 1,
                                  minFontSize: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          */
                        ],
                      ),
                    )
                  ],
                ),
                const Gap(10),
                propertys[index].denda != null
                    ? const DottedLine(
                        dashColor: c.RGB171_O1,
                      )
                    : const SizedBox.shrink(),
                const Gap(10),
                propertys[index].denda != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/utils/svg/dollar.svg',
                                colorFilter: const ColorFilter.mode(
                                    c.R51_G74_B52_O1, BlendMode.srcIn),
                                width: 14,
                                height: 14,
                              ),
                              const Gap(5),
                              Text.rich(TextSpan(
                                  text: 'Denda Rp ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 15.12 / 12,
                                      fontFamily: f.Outfit,
                                      color: c.R51_G74_B52_O1),
                                  children: [
                                    TextSpan(
                                        text: rupiah(
                                            propertys[index].denda!.toInt()),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            height: 15.12 / 12,
                                            fontFamily: f.Outfit,
                                            color: c.R51_G74_B52_O1))
                                  ]))
                            ],
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: c.R51_G74_B52_O1),
                              padding: const EdgeInsets.only(
                                  top: 4, right: 9, bottom: 4, left: 7),
                              child: Row(children: [
                                SvgPicture.asset(
                                    'assets/icons/utils/svg/warning.svg',
                                    width: 10,
                                    height: 10),
                                const Gap(3),
                                Text(
                                    'Terlambat ${propertys[index].dateNow!.difference(propertys[index].dateTarget).inDays} Hari',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        height: 12.6 / 10,
                                        fontFamily: f.Outfit,
                                        color: c.RGB255_O1))
                              ]))
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio:
              propertys[indexOrder].denda != null ? 17 / 11 : 16 / 9, // default
          // aspectRatio: propertys[indexOrder].denda != null ? 17 / 10 : 17 / 9,
          // aspectRatio:
          //     propertys[indexOrder].denda != null ? 378 / 185 : 378 / 144,
          // height: propertys[indexOrder].denda != null
          // ? MediaQuery.of(context).size.height * 0.35
          // : MediaQuery.of(context).size.height * 0.3,
          initialPage: indexOrder,
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            context
                .read<HomeBloc>()
                .add(SwitchPropertyEvent(propertys: propertys, index: index));
          },
        ));
  }
}
