import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../logic/bloc/home_bloc.dart';

class HomeEmptyWidget extends StatelessWidget {
  const HomeEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                fontSize: 18,
                fontFamily: 'Outfit'),
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
                fontSize: 12,
                fontFamily: 'Outfit'),
          ),
        ),
        const Gap(30),
        Image.asset(
          "assets/images/background_house.png",
          scale: 2,
        ),
        const Text(
          "Pesanan Kosong",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 52, 74, 52),
              fontSize: 16,
              fontFamily: 'Outfit'),
        ),
        const Gap(4),
        const Text(
          "Ayo tambahkan pesanan baru",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 155, 155, 155),
              fontSize: 12,
              fontFamily: 'Outfit'),
        ),
        const Gap(10),
        ElevatedButton.icon(
          onPressed: () {
            context.read<HomeBloc>().add(const EksplorPropertyEvent());
          },
          // icon: const Icon(
          //   Icons.search,
          //   color: Color.fromARGB(255, 255, 255, 255),
          // ),
          icon: SvgPicture.asset('assets/icons/utils/svg/search.svg'),
          label: const Text(
            "Eksplor Property",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Outfit'),
          ),
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 51, 74, 52)),
              padding: MaterialStatePropertyAll(EdgeInsets.all(14))),
        ),
      ],
    );
  }
}
