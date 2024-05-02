// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:property_app/core/bottom_navigation_bar/widgets/bottom_navigation_bar_widget.dart';
import 'package:property_app/features/home/logic/bloc/home_bloc.dart';
import 'package:property_app/features/home/presentation/widgets/carousel_slider/slider_property_widget.dart';

import '../widgets/head/head_widget.dart';
import '../widgets/home_state/home_empty_widget.dart';
import '../widgets/home_state/property_order_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          // padding: const EdgeInsets.fromLTRB(25, 40, 25, 40),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// [HEAD]
              const HeadWidget(),

              const Gap(30),

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
                    // const Gap(1),
                    SliderPropertyWidget(
                      diskon: 40,
                      name: "American House",
                      startDate: DateTime(2024, 1, 20),
                      endDate: DateTime(2024, 3, 20),
                      backgroundColor: const Color.fromARGB(255, 154, 202, 62),
                    )
                  ],
                  options: CarouselOptions(
                    viewportFraction: 0.95,
                    // height: 200,
                    autoPlay: true,
                    aspectRatio: 5 / 2,
                    enableInfiniteScroll: false,
                    // enlargeCenterPage: true
                  )),

              const Gap(20),

              /// [BLOC STATE]
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeEmpty) {
                      return const HomeEmptyWidget();
                    } else if (state is PropertyOrder) {}
                    return PropertyOrderWidget(
                      propertyOrder: state as PropertyOrder,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBarWidget(context),
    );
  }
}
