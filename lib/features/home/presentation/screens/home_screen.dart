import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/features/home/logic/bloc/home_bloc.dart';
import 'package:property_app/features/home/presentation/widgets/carousel_slider/slider_property_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/head/head_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// [HEAD]
            const HeadWidget(),

            /// [CAROUSEL SLIDER]
            CarouselSlider(
                items: [
                  SliderPropertyWidget(
                    diskon: 20,
                    name: "American House",
                    startDate: DateTime(2023, 11, 19),
                    endDate: DateTime(2023, 12, 15),
                    backgroundColor: const Color.fromARGB(255, 51, 74, 52),
                  ),
                  SliderPropertyWidget(
                    diskon: 40,
                    name: "American House",
                    startDate: DateTime(2024, 1, 20),
                    endDate: DateTime(2024, 3, 20),
                    backgroundColor: const Color.fromARGB(255, 154, 202, 62),
                  )
                ],
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  // height: 200,
                  autoPlay: true,
                  aspectRatio: 5 / 2,
                  enableInfiniteScroll: false,
                  // enlargeCenterPage: true
                )),

            /// [BLOC STATE]
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeEmpty) {
                    return Container(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
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
                                // fontSize: 18
                              ),
                            ),
                          ),
                          const Align(
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
                                // fontSize: 12
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: Stack(
                          //     alignment: Alignment.center,
                          //     fit: StackFit.passthrough,
                          //     children: [
                          //       SvgPicture.asset(
                          //         "assets/images/svg/background_bank.svg",
                          //         semanticsLabel: "Bank",
                          //         // fit: BoxFit.scaleDown,
                          //       ),
                          //       Align(
                          //         alignment: Alignment.topLeft,
                          //         child: SvgPicture.asset(
                          //           "assets/images/svg/fly.svg",
                          //           semanticsLabel: "Fly",
                          //           // colorFilter:
                          //           //     const ColorFilter.matrix([255, 255, 255, 255]),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SvgPicture.asset(
                          //   "assets/images/svg/all.svg",
                          //   semanticsLabel: "hero",
                          //   height: MediaQuery.of(context).size.height * 0.5,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05),
                            child: Image.asset(
                                "assets/images/background_house.png"),
                          ),
                          const Text(
                            "Pesanan Kosong",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 52, 74, 52)),
                          ),
                          const Text(
                            "Ayo tambahkan pesanan baru",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 155, 155, 155)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            label: const Text(
                              "Eksplor Property",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 51, 74, 52)),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(14))),
                          ),
                        ],
                      ),
                    );
                    // return Container(
                    //   child: SvgPicture.asset(
                    //     "assets/images/svg/background_bank.svg",
                    //     semanticsLabel: "Bank",
                    //   ),
                    // );
                  } else if (state is PesananTerbaru) {}
                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
