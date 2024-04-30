import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_app/features/home/presentation/widgets/carousel_slider/slider_property_widget.dart';

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
          ],
        ),
      )),
    );
  }
}
