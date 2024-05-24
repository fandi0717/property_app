import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;
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
                color: c.R51_G74_B52_O1,
                fontSize: 18,
                fontFamily: f.Outfit),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Daftar pesanan terbaru anda",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: c.RGB158_O1,
                fontSize: 12,
                fontFamily: f.Outfit),
          ),
        ),
        const Gap(20),
        // Expanded(
        //   // flex: 1,
        //   child: Image.asset(
        //     "assets/images/background_house.png",
        //     // scale: 1.5,
        //   ),

        // ),
        Flexible(
            child: Image.asset('assets/images/background_empty.png',
                // scale: MediaQuery.sizeOf(context).height > 850 ? 2 : 1
                )),
        const Gap(20),
        const Text(
          "Pesanan Kosong",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: c.R51_G74_B52_O1,
              fontSize: 16,
              fontFamily: f.Outfit),
        ),
        const Gap(4),
        const Text(
          "Ayo tambahkan pesanan baru",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: c.RGB155_O1,
              fontSize: 12,
              fontFamily: f.Outfit),
        ),
        const Gap(10),
        ElevatedButton.icon(
          onPressed: () {
            context.read<HomeBloc>().add(const EksplorPropertyEvent());
          },
          icon: SvgPicture.asset('assets/icons/utils/svg/search.svg'),
          label: const Text(
            "Eksplor Properti",
            style: TextStyle(
                color: c.RGB255_O1,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: f.Outfit),
          ),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(c.R51_G74_B52_O1),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 25, vertical: 15))),
        ),
      ],
    );
  }
}
