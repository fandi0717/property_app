part of 'bottom_sheet.dart';

buildBottomSheet4Pemesanan(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          // color: const Color.fromARGB(255, 222, 221, 221),
          // padding:
          //     const EdgeInsets.only(top: 20, right: 10, bottom: 15, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tahap Pemesanan',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 51, 74, 52)),
              ),
              const Text(
                'Daftar Menu tahap pemesanan',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromARGB(255, 155, 155, 155)),
              ),
              const Divider(
                color: Color.fromARGB(255, 222, 221, 221),
                // color: Colors.black,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          badges.Badge(
                            badgeContent: const Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.67),
                            ),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 51, 74, 52),
                              // radius: 25,
                              child: SvgPicture.asset(
                                  'assets/icons/utils/svg/booking_fee.svg'),
                            ),
                          ),
                          const Text.rich(TextSpan(
                              text: 'Booking',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 51, 74, 52)),
                              children: [
                                TextSpan(
                                    text: '\nFee',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 51, 74, 52)))
                              ]))
                        ],
                      ),
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              )
            ],
          ),
        );
      },
      showDragHandle: true);
}
