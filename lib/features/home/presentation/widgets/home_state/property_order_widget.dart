// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'card_transaction.dart';

import 'package:property_app/features/home/data/models/transaction_enum.dart';
import 'package:property_app/features/home/presentation/widgets/carousel_slider/slider_property_order.dart';

import '../../../logic/bloc/home_bloc.dart';

class PropertyOrderWidget extends StatelessWidget {
  PropertyOrderWidget({
    super.key,
    required this.propertyOrder,
  });

  final PropertyOrder propertyOrder;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    const completeColor = Color(0xff5e6172);
    const inProgressColor = Color(0xff5ec792);
    const todoColor = Color(0xffd1d2d7);

    int processIndex = 2;

    Color getColor(int index) {
      if (index == processIndex) {
        return inProgressColor;
      } else if (index < processIndex) {
        return completeColor;
      } else {
        return todoColor;
      }
    }

    return Column(
      children: [
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
                        color: Color.fromARGB(
                          255,
                          51,
                          74,
                          52,
                        ),
                        fontSize: 18),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Daftar pesanan terbaru anda",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(
                          255,
                          158,
                          158,
                          158,
                        ),
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(Back2EmptyPropertyEvent());
                },
                icon: const Icon(Icons.arrow_right_alt))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              /// TODO :: ADD TIMELINES
              ///
              /// [Testing]
              // const Text('initial'),
              Text(propertyOrder.propertys[propertyOrder.index].name),
              // propertyOrder.propertys[propertyOrder.index],

              /// [END TESTING]
              ConstrainedBox(
                constraints: const BoxConstraints(),
                child: SliderPropertyOrderWidget(
                  propertys: propertyOrder.propertys,
                  indexOrder: propertyOrder.index,
                  controller: _controller,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: propertyOrder.propertys.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),

                    /// [BUG] NULL CHECK
                    child: Container(
                      width: propertyOrder.index == entry.key ? 19 : 15,
                      height: 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: propertyOrder.index == entry.key
                              ? const Color.fromARGB(255, 51, 74, 52)
                              : const Color.fromARGB(255, 222, 221, 221)),
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
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 51, 74, 52)),
                    ),
                    Text(
                      "Daftar menu transaksi",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color.fromARGB(255, 155, 155, 155)),
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
                                          'assets/images/home_house_model.png'))),
                              // child: Image.asset(
                              //   "assets/images/home_house_model.png",
                              //   // width: 177,
                              //   // height: 178,
                              //   // scale: 10,
                              //   // fit: BoxFit.cover,
                              // ),
                            ),
                          ),
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
                            //   "assets/images/home_house_model.png",
                            //   // width: 177,
                            //   // height: 178,
                            //   // scale: 10,
                            //   // fit: BoxFit.cover,
                            // ),
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
                                          'assets/images/tahap_akad_serah_terima.png'))),
                              // child: Image.asset(
                              //   "assets/images/home_house_model.png",
                              //   // width: 177,
                              //   // height: 178,
                              //   // scale: 10,
                              //   // fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),

        /// [TIMELINES]
        /*
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 1,
                color: const Color(0xff989898),
                connectorTheme: const ConnectorThemeData(
                  thickness: 3.0,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: 4,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    [
                      'Pemesanan',
                      'Administrasi',
                      'Pembangunan',
                      'Serah Terima'
                    ][index],
                  ),
                ),
                connectorBuilder: (_, index, ___) =>
                    index > 0 ? const SolidLineConnector() : null,
                indicatorBuilder: (_, index) {
                  if (index == 0) {
                    return const DotIndicator(
                      color: Colors.green,
                      child: Icon(Icons.check, color: Colors.white),
                    );
                  } else {
                    return const OutlinedDotIndicator(
                      borderWidth: 2.5,
                    );
                  }
                },
                // connectorThemeBuilder: (context, index) =>
                //     index > 0 ? ConnectorThemeData(color: Colors.green) : null,
              ),
            ))
            */
      ],
    );
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    double angle;
    Offset offset1;
    Offset offset2;

    Path path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Prospect',
  'Tour',
  'Offer',
  'Contract',
  'Settled',
];
