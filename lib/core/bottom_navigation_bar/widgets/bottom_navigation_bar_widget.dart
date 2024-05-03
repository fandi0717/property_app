import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_app/routes/route_name.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import '../cubit/bottom_navigation_bar_cubit.dart';

// Widget bottomNavigationBarWidget(BuildContext context) {
//   return AnimatedBottomNavigationBar(
//     icons: const [
//       Icons.home,
//       Icons.house,
//       Icons.document_scanner,
//       Icons.shopping_cart,
//       Icons.person
//     ],
//     gapLocation: GapLocation.none,
//     notchSmoothness: NotchSmoothness.defaultEdge,
//     leftCornerRadius: 24,
//     rightCornerRadius: 24,
//     activeColor: const Color.fromARGB(255, 51, 74, 52),
//     inactiveColor: const Color.fromARGB(255, 155, 155, 155),
//     activeIndex: context.read<BottomNavigationBarCubit>().state,
//     onTap: (int index) {
//       context.read<BottomNavigationBarCubit>().changeIndex(index);
//       changeBodyUI(index, context);
//     },
//   );
// }

changeBodyUI(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.HOME, (route) => false);
      break;
    case 1:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.BUILDING, (route) => false);
    default:
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.HOME, (route) => false);
      break;
  }
}

// Widget bottomNavigationBarWidget(BuildContext context) {
//   return CustomNavigationBar(
//     items: [
//       CustomNavigationBarItem(icon: const Icon(Icons.house)),
//       CustomNavigationBarItem(icon: const Icon(Icons.mosque)),
//       CustomNavigationBarItem(icon: const Icon(Icons.document_scanner)),
//       CustomNavigationBarItem(icon: const Icon(Icons.shopping_cart_outlined)),
//       CustomNavigationBarItem(icon: const Icon(Icons.person)),
//     ],
//     selectedColor: const Color.fromARGB(255, 51, 74, 52),
//     currentIndex: context.read<BottomNavigationBarCubit>().state,
//     unSelectedColor: const Color.fromARGB(255, 155, 155, 155),
//     onTap: (int index) {
//       context.read<BottomNavigationBarCubit>().changeIndex(index);
//       changeBodyUI(index, context);
//     },
//   );
// }

Widget bottomNavigationBarWidget(BuildContext context) {
  return CustomNavigationBar(
    // iconSize: 12,
    items: [
      CustomNavigationBarItem(
          icon: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/home.svg',
                // theme: SvgTheme(currentColor: Colors.green),
                // width: 14,
                height: constraints.maxHeight,
                // colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
              ),
            ),
          ),
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/indicator.svg',

                // width: 10,
                height: constraints.maxHeight,
              ),
            ),
          )
        ],
      )),
      CustomNavigationBarItem(
          icon: Column(
        children: [
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/home.svg',
                // theme: SvgTheme(currentColor: Colors.green),
                // width: 14,
                height: constraints.maxHeight,
                // colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
              ),
            ),
          ),
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/indicator.svg',

                // width: 10,
                height: constraints.maxHeight,
              ),
            ),
          )
        ],
      )),
      CustomNavigationBarItem(
          icon: Column(
        children: [
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/home.svg',
                // theme: SvgTheme(currentColor: Colors.green),
                // width: 14,
                height: constraints.maxHeight,
                // colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
              ),
            ),
          ),
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/indicator.svg',

                // width: 10,
                height: constraints.maxHeight,
              ),
            ),
          )
        ],
      )),
      CustomNavigationBarItem(
          icon: Column(
        children: [
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/home.svg',
                // theme: SvgTheme(currentColor: Colors.green),
                // width: 14,
                height: constraints.maxHeight,
                // colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
              ),
            ),
          ),
          Flexible(
            child: LayoutBuilder(
              builder: (context, constraints) => SvgPicture.asset(
                'assets/icons/navbar/svg/indicator.svg',

                // width: 10,
                height: constraints.maxHeight,
              ),
            ),
          )
        ],
      )),
      CustomNavigationBarItem(
          icon: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/icons/navbar/svg/home.svg',
              // theme: SvgTheme(currentColor: Colors.green),
              width: 24,
              height: 24,
              // colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              'assets/icons/navbar/svg/indicator.svg',
              width: 11,
              height: 61,
            ),
          )
        ],
      )),
    ],
    selectedColor: const Color.fromARGB(255, 51, 74, 52),
    currentIndex: context.read<BottomNavigationBarCubit>().state,
    unSelectedColor: const Color.fromARGB(255, 155, 155, 155),
    onTap: (int index) {
      context.read<BottomNavigationBarCubit>().changeIndex(index);
      changeBodyUI(index, context);
    },
  );
}
