import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                fontSize: 18),
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
                fontSize: 12),
          ),
        ),
        const Gap(50),
        Image.asset(
          "assets/images/background_house.png",
          scale: 1.4,
        ),
        const Text(
          "Pesanan Kosong",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 52, 74, 52),
              fontSize: 16),
        ),
        const Text(
          "Ayo tambahkan pesanan baru",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 155, 155, 155),
              fontSize: 12),
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
                fontWeight: FontWeight.w500,
                fontSize: 16),
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
