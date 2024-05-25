// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/bottom_navigation_bar/widgets/bottom_navigation_bar_widget.dart';
import '../../../../core/res/color.dart' as c;
import '../../logic/bloc/home_bloc.dart';
import '../widgets/carousel_slider/slider_property_ads_widget.dart';
import '../widgets/head/head_widget.dart';
import '../widgets/home_state/home_empty_widget.dart';
import '../widgets/home_state/property_order_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: Container(
        color: c.RGB245_O1,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// [HEAD]
            const HeadWidget(),

            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeEmpty) {
                  return const Gap(30);
                }
                return const Gap(25);
              },
            ),

            /// [CAROUSEL SLIDER]
            CarouselSlider(
                items: [
                  SliderPropertyAdsWidget(
                    diskon: 20,
                    name: "American House",
                    startDate: DateTime(2023, 11, 19),
                    endDate: DateTime(2023, 12, 15),
                    backgroundColor: c.R51_G74_B52_O1,
                  ),
                  // const Gap(1),
                  SliderPropertyAdsWidget(
                    diskon: 40,
                    name: "American House",
                    startDate: DateTime(2024, 1, 20),
                    endDate: DateTime(2024, 3, 20),
                    backgroundColor: c.R154_G202_B62_O1,
                  )
                ],
                options: CarouselOptions(
                  // viewportFraction: 0.95,
                  viewportFraction: 0.95,
                  // height: 200,
                  autoPlay: true,
                  aspectRatio: 5 / 2,
                  enableInfiniteScroll: false,
                  // enlargeCenterPage: true
                )),

            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeEmpty) {
                  return const Gap(30);
                }
                return const Gap(25);
              },
            ),

            /// [BLOC STATE]
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeEmpty) {
                    return const HomeEmptyWidget()
                        .animate()
                        .fade(duration: 300.ms, curve: Curves.easeOut);
                  }
                  return PropertyOrderWidget(
                    propertyOrder: state as PropertyOrder,
                  ).animate().fade(duration: 300.ms, curve: Curves.easeOut);
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
