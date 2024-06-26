// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;
import '../../../data/models/transaction_enum.dart';
import '../../../logic/bloc/home_bloc.dart';
import '../carousel_slider/slider_property_order.dart';
import 'card_transaction.dart';
import 'timeline_widget.dart';

class PropertyOrderWidget extends StatelessWidget {
  PropertyOrderWidget({
    super.key,
    required this.propertyOrder,
  });

  final PropertyOrder propertyOrder;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// [PESANAN TERBARU ---]
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pesanan Terbaru",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: c.R51_G74_B52_O1,
                      height: 22.68 / 18,
                      fontSize: 18,
                      fontFamily: f.Outfit),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daftar pesanan terbaru anda",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: c.RGB155_O1,
                      height: 15.12 / 12,
                      fontSize: 12,
                      fontFamily: f.Outfit),
                ),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(Back2EmptyPropertyEvent());
              },
              child: SvgPicture.asset(
                'assets/icons/utils/svg/arrow_right.svg',
                colorFilter:
                    const ColorFilter.mode(c.R51_G74_B52_O1, BlendMode.srcIn),
              ))
        ],
      ),
      const Gap(20),
      Expanded(
          child: SingleChildScrollView(
        child: Column(
          children: [
            /// [TIMELINES]
            Container(
                height: MediaQuery.sizeOf(context).height < 750
                    ? MediaQuery.sizeOf(context).height * 0.08
                    : MediaQuery.sizeOf(context).height < 850
                        ? MediaQuery.sizeOf(context).height * 0.07
                        : MediaQuery.sizeOf(context).height * 0.06,
                // height: constraints.minHeight,

                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: c.RGB255_O1,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: ProcessTimelinePage(
                    transaction: propertyOrder
                        .propertys[propertyOrder.index].transaction)),

            const Gap(10),

            /// [SLIDER PROPERTY]
            SliderPropertyOrderWidget(
              propertys: propertyOrder.propertys,
              indexOrder: propertyOrder.index,
              controller: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: propertyOrder.propertys.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: propertyOrder.index == entry.key ? 19 : 15,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: propertyOrder.index == entry.key
                            ? c.R51_G74_B52_O1
                            : c.R222_G221_B221_O1),
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                  ),
                );
              }).toList(),
            ),
            const Gap(25),

            /// [DAFTAR MENU TRANSAKSI]
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                        fontSize: 18,
                        height: 22.68 / 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: f.Outfit,
                        color: c.R51_G74_B52_O1),
                  ),
                  Text(
                    "Daftar menu transaksi",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 15.12 / 12,
                        fontFamily: f.Outfit,
                        color: c.RGB155_O1),
                  )
                ],
              ),
              SvgPicture.asset(
                'assets/icons/utils/svg/twotoon_category.svg',
                width: 24,
                height: 24,
              )
            ]),

            const Gap(20),

            /// [card]
            // 1
            Row(
              children: [
                /// [pemesanan]
                Expanded(
                  child: CardMenuTransaksi(
                    transaction: Transaction.pemesanan,
                    percentage: propertyOrder.propertys[propertyOrder.index]
                        .transaction[Transaction.pemesanan] as double,
                    /*
                    imgRender: Container(
                      // margin: const EdgeInsets.only(
                      //   bottom: 5,
                      // ),
                      padding: const EdgeInsets.only(right: 5),
                      child: AspectRatio(
                        aspectRatio: 177 / 178,
                        child: Transform(
                          transform: Matrix4.rotationY(pi),
                          alignment: Alignment.center,
                          child: Container(
                            // width: 178,
                            // height: 128,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.centerRight,
                                    image: AssetImage(
                                        'assets/images/tahap_pemesanan.png')
                                        )),
                            /*
                            child: Image.asset(
                              "assets/images/tahap_pemesanan.png",
                              // width: 177,
                              // height: 178,
                              // scale: 10,
                              // fit: BoxFit.cover,
                            ),
                            */
                          ),
                        ),
                      ),
                    ),
                    */

                    imgRender: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(13)),
                      child: Image.asset(
                        'assets/images/tahap_pemesanan.png',
                      ),
                    ),
                  ),
                ),
                const Gap(15),

                /// [administrasi]
                Expanded(
                  child: CardMenuTransaksi(
                    transaction: Transaction.administrasi,
                    percentage: propertyOrder.propertys[propertyOrder.index]
                        .transaction[Transaction.administrasi] as double,
                    /*
                    imgRender: Transform.translate(
                      // offset: const Offset(15, 0),
                      offset: const Offset(15, 0),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: AspectRatio(
                          aspectRatio: 177 / 178,
                          child: Transform.rotate(
                            angle: 90 * pi / 180,
                            child: Container(
                              // width: 177,
                              // height: 100,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/tahap_administrasi.png'),
                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.centerLeft)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    */
                    imgRender: Transform.scale(
                      alignment: Alignment.bottomRight,
                      scale: 0.9,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(13)),
                        child: Image.asset(
                          'assets/images/tahap_administrasi.png',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            const Gap(20),
            // 2
            Row(
              children: [
                /// [pembangunan]
                Expanded(
                  child: CardMenuTransaksi(
                    transaction: Transaction.pembangunan,
                    percentage: propertyOrder.propertys[propertyOrder.index]
                        .transaction[Transaction.pembangunan] as double,
                    /*
                    imgRender: Container(
                      padding: const EdgeInsets.only(bottom: 5, right: 5),
                      child: AspectRatio(
                        aspectRatio: 177 / 178,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerLeft,
                                  image: AssetImage(
                                      'assets/images/tahap_pembangunan.png'))),
                          // child: Image.asset(
                          //   "assets/images/tahap_pemesanan.png",
                          //   // width: 177,
                          //   // height: 178,
                          //   // scale: 10,
                          //   // fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ),
                    */
                    imgRender: Transform.scale(
                      alignment: Alignment.bottomRight,
                      scale: .8,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(13)),
                        child: Image.asset(
                          'assets/images/tahap_pembangunan.png',
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(15),

                /// [akad & serah terima]
                Expanded(
                  child: CardMenuTransaksi(
                    transaction: Transaction.serahTerima,
                    percentage: propertyOrder.propertys[propertyOrder.index]
                        .transaction[Transaction.serahTerima] as double,
                    /*
                    imgRender: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Transform.translate(
                        offset: const Offset(10, 40),
                        child: AspectRatio(
                          aspectRatio: 177 / 178,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topCenter,
                                    image: AssetImage(
                                        'assets/images/tahap_akad_serah_terima.png'))
                                        ),

                            /*
                            child: Image.asset(
                              "assets/images/tahap_pemesanan.png",
                              // width: 177,
                              // height: 178,
                              // scale: 10,
                              // fit: BoxFit.cover,
                            // ),
                            */
                          ),
                        ),
                      ),
                    ),
                    */
                    imgRender: Transform.scale(
                      scaleY: 0.7,
                      scaleX: 0.8,
                      // scale: .7,
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/tahap_akad_serah_terima.png',
                        // scale: 0.2,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ]);
  }
}
