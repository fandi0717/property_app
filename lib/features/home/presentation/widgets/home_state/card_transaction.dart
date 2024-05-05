import 'package:flutter/material.dart';
import 'package:property_app/features/home/presentation/widgets/home_state/bottom_sheet.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../data/models/transaction_enum.dart';

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
                    ? const Color.fromARGB(255, 51, 74, 52)
                    : const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Stack(
                children: [
                  widget.transaction == Transaction.pemesanan
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                              right: 5,
                            ),
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.65,
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
                      : Positioned.fill(
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
                                        borderRadius:
                                            BorderRadius.circular(70)),
                                  ),
                                ),
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
                                color: widget.transaction ==
                                        Transaction.pemesanan
                                    ? Colors.white
                                    : const Color.fromARGB(255, 51, 74, 52)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(namaTahap,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: widget.transaction ==
                                          Transaction.pemesanan
                                      ? Colors.white
                                      : const Color.fromARGB(255, 51, 74, 52))),
                        ),
                        Row(
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
                                              color: Colors.white),
                                          children: [
                                            const TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 5,
                                                    color: Colors.white))
                                          ])),
                                    ),
                                  ),
                                  */
                                    child: SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: SimpleCircularProgressBar(
                                        // size: 35,
                                        backStrokeWidth: 3,
                                        progressStrokeWidth: 3,
                                        progressColors: widget.transaction ==
                                                Transaction.pemesanan
                                            ? [
                                                const Color.fromARGB(
                                                    255, 255, 92, 92)
                                              ]
                                            : [
                                                const Color.fromARGB(
                                                    255, 51, 74, 52)
                                              ],
                                        backColor: const Color.fromARGB(
                                            255, 226, 233, 226),
                                        mergeMode: true,
                                        onGetText: (double value) {
                                          return Text.rich(TextSpan(
                                              text: value.toInt().toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: widget.transaction ==
                                                          Transaction.pemesanan
                                                      ? Colors.white
                                                      : const Color.fromARGB(
                                                          255, 51, 74, 52)),
                                              children: [
                                                TextSpan(
                                                    text: '%',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 5,
                                                        color:
                                                            widget.transaction ==
                                                                    Transaction
                                                                        .pemesanan
                                                                ? Colors.white
                                                                : const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    51,
                                                                    74,
                                                                    52)))
                                              ]));
                                        },
                                        valueNotifier:
                                            // ValueNotifier(widget.percentage),
                                            valueNotifier,
                                      ),
                                    )),
                              ),

                              /// [img home]
                              // Expanded(
                              //   child: Transform(
                              //     transform: Matrix4.rotationY(pi),
                              //     alignment: Alignment.center,
                              //     child: AspectRatio(
                              //       aspectRatio: 177 / 178,
                              //       child: Image.asset(
                              //         "assets/images/home_house_model.png",
                              //         // width: 177,
                              //         // height: 178,
                              //         // scale: 10,
                              //         fit: BoxFit.cover,
                              //       ),
                              //     ),
                              //   ),
                              // )
                              Expanded(
                                child: widget.imgRender,
                              )
                            ])
                      ]),
                ],
              )),
        ),
      ),
    );
  }
}
