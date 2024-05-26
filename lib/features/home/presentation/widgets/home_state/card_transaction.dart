import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;
import '../../../data/models/transaction_enum.dart';
import 'bottom_sheet/bottom_sheet.dart';

class CardMenuTransaksi extends StatefulWidget {
  const CardMenuTransaksi(
      {super.key,
      required this.transaction,
      required this.percentage,
      required this.imgRender});

  final Transaction transaction;
  final double percentage;
  final Widget imgRender;

  @override
  State<CardMenuTransaksi> createState() => _CardMenuTransaksiState();
}

class _CardMenuTransaksiState extends State<CardMenuTransaksi> {
  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(widget.percentage);
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String namaTahap;

    if (widget.percentage != valueNotifier.value) {
      valueNotifier.value = widget.percentage;
    }

    switch (widget.transaction) {
      case Transaction.pembangunan:
        namaTahap = "Pembangunan";
      case Transaction.administrasi:
        namaTahap = "Administrasi";
      case Transaction.pemesanan:
        namaTahap = "Pemesanan";
      case Transaction.serahTerima:
        namaTahap = "Akad & Serah Terima";
    }

    return GestureDetector(
      onTap: () {
        showBottomSheetWidget(context, widget.transaction);
      },
      child: Opacity(
        opacity: widget.percentage > 0 ? 1 : 0.6,
        child: AspectRatio(
          aspectRatio: 181 / 174,
          child: Container(
              // width: MediaQuery.of(context).size.width * 0.4,
              // height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: widget.transaction == Transaction.pemesanan
                      ? c.R51_G74_B52_O1
                      : c.RGB255_O1,
                  boxShadow: widget.transaction == Transaction.pemesanan
                      ? [
                          const BoxShadow(
                              offset: Offset(0, 4.12),
                              blurRadius: 2.47,
                              color: c.RGB63_O005),
                          const BoxShadow(
                              offset: Offset(0, 10.42),
                              blurRadius: 6.25,
                              color: c.RGB63_O008),
                          const BoxShadow(
                              offset: Offset(0, 21.27),
                              blurRadius: 12.76,
                              color: c.RGB63_O009),
                          const BoxShadow(
                              offset: Offset(0, 43.8),
                              blurRadius: 26.28,
                              color: c.RGB63_O012),
                          const BoxShadow(
                              offset: Offset(0, 120),
                              blurRadius: 72,
                              color: c.RGB63_O017),
                        ]
                      : widget.percentage > 0
                          ? [
                              const BoxShadow(
                                  offset: Offset(0, 14.1),
                                  blurRadius: 5.32,
                                  color: c.R170_G167_B167_O006),
                              const BoxShadow(
                                  offset: Offset(0, 47.35),
                                  blurRadius: 17.87,
                                  color: c.R170_G167_B167_O008),
                              const BoxShadow(
                                  offset: Offset(0, 212),
                                  blurRadius: 80,
                                  color: c.R170_G167_B167_O014)
                            ]
                          : null),
              child: Stack(
                children: [
                  widget.transaction == Transaction.pemesanan
                      ?
                      /*
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                              right: 5,
                            ),
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.7,
                                heightFactor: 0.9,
                                child: AspectRatio(
                                  aspectRatio: 198 / 219,
                                  child: Container(
                                    // width: 198,
                                    // height: 219,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 47, 69, 48),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(70)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        */
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(13),
                              bottomRight: Radius.circular(13)),
                          child: Transform.translate(
                            offset: const Offset(55, 0),
                            child: Container(
                              width: 198,
                              height: 219,
                              decoration: const BoxDecoration(
                                color: c.R47_G69_B48_O1,
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(130, 174)),
                                // color: Colors.red,
                                // shape: BoxShape.circle
                              ),
                            ),
                          ),
                        )
                      :
                      /*
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                // widthFactor: 1,
                                heightFactor: 0.6,
                                child: AspectRatio(
                                  aspectRatio: 296 / 296,
                                  child: Container(
                                    // width: 198,
                                    // height: 219,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 248, 248, 248),
                                        // color: Colors.yellow,

                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(70)
                                        // shape: BoxShape.circle
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        */
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(13),
                              bottomRight: Radius.circular(13)),
                          child: Transform.translate(
                            offset: const Offset(0, 60),
                            child: Container(
                              width: 296,
                              height: 296,
                              decoration: const BoxDecoration(
                                color: c.RGB248_O1,
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(189, 109)),
                                // color: Colors.red,
                                // shape: BoxShape.circle
                              ),
                            ),
                          ),
                        ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 15),
                          child: Text(
                            'Tahap',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 15 / 12,
                                fontFamily: f.Lexend,
                                color:
                                    widget.transaction == Transaction.pemesanan
                                        ? c.RGB255_O1
                                        : c.R51_G74_B52_O1),
                          ),
                        ),
                        //  [Gap]
                        widget.transaction == Transaction.pemesanan
                            ? const Gap(5)
                            : const Gap(1),

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: AutoSizeText(namaTahap,
                              minFontSize: 1,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 17.5 / 14,
                                  fontFamily: f.Lexend,
                                  color: widget.transaction ==
                                          Transaction.pemesanan
                                      ? c.RGB255_O1
                                      : c.R51_G74_B52_O1)),
                        ),
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// [percentage]
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15, bottom: 15),
                                      /* 
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3,
                                            color: const Color.fromARGB(
                                                255, 255, 92, 92)),
                                      ),
                                      child: Center(
                                        child: Text.rich(TextSpan(
                                            text: percentage.toInt().toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: c.RGB255_O1),
                                            children: [
                                              const TextSpan(
                                                  text: '%',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 5,
                                                      color: c.RGB255_O1))
                                            ])),
                                      ),
                                    ),
                                    */
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: widget.transaction ==
                                                    Transaction.pemesanan
                                                ? c.R51_G74_B52_O1
                                                : c.RGB255_O1,
                                            boxShadow: widget.percentage == 0
                                                ? null
                                                : [
                                                    const BoxShadow(
                                                        blurRadius: 2.5,
                                                        spreadRadius: 0,
                                                        color:
                                                            c.R9_G19_B10_O016,
                                                        offset: Offset(0, 5))
                                                  ]),
                                        child: SimpleCircularProgressBar(
                                          // size: 35,
                                          backStrokeWidth: 3,
                                          progressStrokeWidth: 3,
                                          progressColors: widget.transaction ==
                                                  Transaction.pemesanan
                                              ? [c.R255_G92_B92_O1]
                                              : [c.R51_G74_B52_O1],
                                          backColor: widget.transaction ==
                                                  Transaction.pemesanan
                                              ? c.RGB255_O1
                                              : c.R226_G233_B226_O1,
                                          mergeMode: true,
                                          onGetText: (double value) {
                                            return Text.rich(TextSpan(
                                                text: value.toInt().toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: f.Rubix,
                                                    fontSize: 12,
                                                    height: 14.22 / 12,
                                                    color: widget.transaction ==
                                                            Transaction
                                                                .pemesanan
                                                        ? c.RGB255_O1
                                                        : c.R51_G74_B52_O1),
                                                children: [
                                                  TextSpan(
                                                      text: '%',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: f.Rubix,
                                                          fontSize: 5,
                                                          height: 5.93 / 5,
                                                          color: widget
                                                                      .transaction ==
                                                                  Transaction
                                                                      .pemesanan
                                                              ? c.RGB255_O1
                                                              : c.R51_G74_B52_O1))
                                                ]));
                                          },
                                          valueNotifier:
                                              // ValueNotifier(widget.percentage),
                                              valueNotifier,
                                        ),
                                      )),
                                ),

                                /// [img]
                                /*
                                Expanded(
                                  child: Transform(
                                    transform: Matrix4.rotationY(pi),
                                    alignment: Alignment.center,
                                    child: AspectRatio(
                                      aspectRatio: 177 / 178,
                                      child: Image.asset(
                                        "assets/images/tahap_pemesanan.png",
                                        // width: 177,
                                        // height: 178,
                                        // scale: 10,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                                */

                                // Expanded(
                                //   child: widget.imgRender,
                                // )
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [widget.imgRender],
                                  ),
                                )
                              ]),
                        )
                      ]),
                ],
              )),
        ),
      ),
    );
  }
}
