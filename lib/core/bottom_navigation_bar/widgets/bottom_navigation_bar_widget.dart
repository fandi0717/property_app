import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../../../routes/route_name.dart';
import '../cubit/bottom_navigation_bar_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({super.key});

  final List<String> iconNonactivePaths = [
    'assets/icons/navbar/svg/nonactive/home.svg',
    'assets/icons/navbar/svg/nonactive/building.svg',
    'assets/icons/navbar/svg/nonactive/document.svg',
    'assets/icons/navbar/svg/nonactive/cart.svg',
    'assets/icons/navbar/svg/nonactive/account.svg',
  ];

  final List<String> iconActivePaths = [
    'assets/icons/navbar/svg/active/home.svg',
    'assets/icons/navbar/svg/active/building.svg',
    'assets/icons/navbar/svg/active/document.svg',
    'assets/icons/navbar/svg/active/cart.svg',
    'assets/icons/navbar/svg/active/account.svg',
  ];

  final String indicatorActivePath = 'assets/icons/navbar/svg/indicator.svg';

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        // height: MediaQuery.of(context).size.height * 0.1,
        // safeAreaValues: SafeAreaValues(bottom: false),
        itemCount: iconActivePaths.length,
        tabBuilder: (index, isActive) {
          if (isActive) {
            return Column(
              children: [
                const Flexible(flex: 1, child: Gap(10)),
                Flexible(
                  flex: 3,
                  child: SvgPicture.asset(iconActivePaths[index],
                      colorFilter: const ColorFilter.mode(
                          Color.fromARGB(255, 51, 74, 52), BlendMode.srcIn)),
                ),
                const Flexible(flex: 1, child: Gap(20)),
                Flexible(
                  flex: 2,
                  child: SvgPicture.asset(
                    indicatorActivePath,
                  ),
                )
              ],
            );
          }
          return Column(
            children: [
              const Flexible(flex: 1, child: Gap(10)),
              Flexible(
                flex: 3,
                child: SvgPicture.asset(iconNonactivePaths[index],
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(255, 155, 155, 155), BlendMode.srcIn)),
              ),
              const Flexible(flex: 1, child: Gap(20)),
              Flexible(
                flex: 2,
                child: SvgPicture.asset(
                  indicatorActivePath,
                  colorFilter: const ColorFilter.mode(
                      Colors.transparent, BlendMode.srcIn),
                ),
              )
            ],
          );
        },
        activeIndex: context.read<BottomNavigationBarCubit>().state,
        onTap: (int index) {
          context.read<BottomNavigationBarCubit>().changeIndex(index);
          changeBodyUI(index, context);
        });
  }
}

changeBodyUI(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.HOME, (route) => false);
      break;
    case 1:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.BUILDING, (route) => false);
    case 2:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.DOCUMENTS, (route) => false);
    case 3:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.CART, (route) => false);
    case 4:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.ACCOUNT, (route) => false);
  }
}



// [ARSIP]
/*
Widget bottomNavigationBarWidget(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: [
      /// [home]
      BottomNavigationBarItem(
        label: '',
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/nonactive/home.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 155, 155, 155), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
            )
          ],
        ),
        activeIcon: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/navbar/svg/active/home.svg',
              colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 51, 74, 52), BlendMode.srcIn),
            ),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
            )
          ],
        ),
      ),

      /// [building]
      BottomNavigationBarItem(
        label: '',
        icon: Column(
          children: [
            SvgPicture.asset(
              'assets/icons/navbar/svg/nonactive/building.svg',
              colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 155, 155, 155), BlendMode.srcIn),
            ),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
            )
          ],
        ),
        activeIcon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/active/building.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 51, 74, 52), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
            )
          ],
        ),
      ),

      /// [document]
      BottomNavigationBarItem(
        label: '',
        icon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/nonactive/document.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 155, 155, 155), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
            )
          ],
        ),
        activeIcon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/active/document.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 51, 74, 52), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
            )
          ],
        ),
      ),

      /// [cart]
      BottomNavigationBarItem(
        label: '',
        icon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/nonactive/cart.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 155, 155, 155), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
            )
          ],
        ),
        activeIcon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/active/cart.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 51, 74, 52), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
            )
          ],
        ),
      ),

      /// [account]
      BottomNavigationBarItem(
        label: '',
        icon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/nonactive/account.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 155, 155, 155), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
            )
          ],
        ),
        activeIcon: Column(
          children: [
            SvgPicture.asset('assets/icons/navbar/svg/active/account.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 51, 74, 52), BlendMode.srcIn)),
            const Gap(20),
            SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
            )
          ],
        ),
      ),
    ],
    currentIndex: context.read<BottomNavigationBarCubit>().state,
    onTap: (int index) {
      context.read<BottomNavigationBarCubit>().changeIndex(index);
      changeBodyUI(index, context);
    },
  );
}
*/
// [END ARSIP]