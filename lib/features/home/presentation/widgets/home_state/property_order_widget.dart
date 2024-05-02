import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';
import '../../../data/models/property.dart';
import '../../../logic/bloc/home_bloc.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyOrderWidget extends StatelessWidget {
  const PropertyOrderWidget({
    super.key,
    required this.propertyOrder,
  });

  final PropertyOrder propertyOrder;

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
                onPressed: () {}, icon: const Icon(Icons.arrow_right_alt))
          ],
        ),

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
        /// [Testing]
        // const Text('initial'),
        Text(propertyOrder.propertys[propertyOrder.index].name),
        // propertyOrder.propertys[propertyOrder.index],

        /// [END TESTING]
        SliderCustom(
          propertys: propertyOrder.propertys,
        )
      ],
    );
  }
}

class SliderCustom extends StatelessWidget {
  const SliderCustom({super.key, required this.propertys});

  final List<Property> propertys;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: propertys.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            // height: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                        // height: 15.12
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 154, 202, 62),
                      ),
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      // height: MediaQuery.of(context).size.height * 0.2,
                      // width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          propertys[index].jenisProperty,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              // height: 15.12,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

                /// [img, information]
                Row(
                  children: [
                    Card(
                      child: Image.asset(
                        propertys[index].imgPath,
                        // scale: 2,
                        width: 100,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.home,
                              size: 14,
                            ),
                            const Gap(5),
                            AutoSizeText(
                              propertys[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                              maxLines: 1,
                              minFontSize: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 14,
                            ),
                            const Gap(5),
                            AutoSizeText(
                              propertys[index].location,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                              maxLines: 1,
                              minFontSize: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range_outlined,
                              size: 14,
                            ),
                            const Gap(5),
                            AutoSizeText(
                              DateFormat('dd/MM/yyyy, HH:mm')
                                  .format(propertys[index].dateTarget),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                              maxLines: 1,
                              minFontSize: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        // AutoSizeText.rich(TextSpan(text: 'Rp')),
                        Row(
                          children: [
                            const Text(
                              "Rp",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                            ),
                            const Gap(5),
                            AutoSizeText(
                              // propertys[index].price.toInt().toString(),
                              rupiah(propertys[index].price.toInt()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                              maxLines: 1,
                              minFontSize: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
        options: CarouselOptions(
          // height: 500,
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            // context
            //     .read<HomeBloc>()
            //     .add(SwitchPropertyEvent(propertys: propertys, index: index));
            context
                .read<HomeBloc>()
                .add(SwitchPropertyEvent(propertys: propertys, index: index));
          },
        ));
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
