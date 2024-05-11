// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_sheet.dart';

buildBottomSheet4Pemesanan(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 0,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
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
                    fontFamily: 'Outfit',
                    color: Color.fromARGB(255, 51, 74, 52)),
              ),
              const Text(
                'Daftar Menu tahap pemesanan',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Outfit',
                    fontSize: 12,
                    color: Color.fromARGB(255, 155, 155, 155)),
              ),
              const Gap(2),
              const Divider(
                color: Color.fromARGB(255, 222, 221, 221),
              ),
              const Gap(2),

              /*
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 25, right: 25),
                itemCount: BottomSheetComponent.getPemesanan.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return BottomSheetComponent.getPemesanan[index];
                },
              )
              */

              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 25, right: 25),
                  child: DynamicHeightGridView(
                    // rowCrossAxisAlignment: CrossAxisAlignment.center,
                    builder: (context, index) {
                      return BottomSheetComponent.getPemesanan[index];
                    },
                    itemCount: BottomSheetComponent.getPemesanan.length,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                ),
              )
            ],
          ),
        );
      },
      showDragHandle: true);
}

buildBottomSheet4Administrasi(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 0,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          // color: const Color.fromARGB(255, 222, 221, 221),
          // padding:
          //     const EdgeInsets.only(top: 20, right: 10, bottom: 15, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tahap Administrasi',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    color: Color.fromARGB(255, 51, 74, 52)),
              ),
              const Text(
                'Daftar menu tahap administrasi',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    color: Color.fromARGB(255, 155, 155, 155)),
              ),
              const Gap(2),
              const Divider(
                color: Color.fromARGB(255, 222, 221, 221),
              ),
              const Gap(2),

              /*
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 25, right: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // crossAxisSpacing: 20
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  // crossAxisSpacing: MediaQuery.of(context).size.width * 0.3,
                  // mainAxisSpacing:
                  //     MediaQuery.of(context).size.height * 0.2
                ),
                itemBuilder: (context, index) {
                  return BottomSheetComponent.getAdministrasi[index];
                },
                itemCount: BottomSheetComponent.getAdministrasi.length,
              ),
*/

              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 25, right: 25),
                  child: DynamicHeightGridView(
                    // rowCrossAxisAlignment: CrossAxisAlignment.center,
                    builder: (context, index) {
                      return BottomSheetComponent.getAdministrasi[index];
                    },
                    itemCount: BottomSheetComponent.getAdministrasi.length,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                ),
              )
            ],
          ),
        );
      },
      showDragHandle: true);
}

buildBottomSheet4Pembangunan(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          // padding:
          //     const EdgeInsets.only(top: 20, right: 10, bottom: 15, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tahap Pembangunan',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    color: Color.fromARGB(255, 51, 74, 52)),
              ),
              const Text(
                'Daftar menu tahap pembangunan rumah',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    color: Color.fromARGB(255, 155, 155, 155)),
              ),
              const Gap(2),
              const Divider(
                color: Color.fromARGB(255, 222, 221, 221),
              ),
              const Gap(2),

              /*
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 25, right: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return BottomSheetComponent.getPembangunan[index];
                },
                itemCount: BottomSheetComponent.getPembangunan.length,
              ),
              */

              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 25, right: 25),
                  child: DynamicHeightGridView(
                    // rowCrossAxisAlignment: CrossAxisAlignment.center,
                    builder: (context, index) {
                      return BottomSheetComponent.getPembangunan[index];
                    },
                    itemCount: BottomSheetComponent.getPembangunan.length,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                ),
              )
            ],
          ),
        );
      },
      showDragHandle: true);
}

buildBottomSheet4AkadSerahTerima(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 0,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          // color: const Color.fromARGB(255, 222, 221, 221),
          // padding:
          //     const EdgeInsets.only(top: 20, right: 10, bottom: 15, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tahap Akad & Serah Terima',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    color: Color.fromARGB(255, 51, 74, 52)),
              ),
              const Text(
                'Daftar menu tahap akad & serah terima',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Outfit',
                    fontSize: 12,
                    color: Color.fromARGB(255, 155, 155, 155)),
              ),
              const Gap(2),
              const Divider(
                color: Color.fromARGB(255, 222, 221, 221),
              ),
              const Gap(2),

              /*
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 25, right: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  // crossAxisSpacing: MediaQuery.of(context).size.width * 0.3,
                  // mainAxisSpacing:
                  //     MediaQuery.of(context).size.height * 0.2
                ),
                itemBuilder: (context, index) {
                  return BottomSheetComponent.getAkadSerahTerima[index];
                },
                itemCount: BottomSheetComponent.getAkadSerahTerima.length,
              ),
              */

              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 25, right: 25),
                  child: DynamicHeightGridView(
                    // rowCrossAxisAlignment: CrossAxisAlignment.center,
                    builder: (context, index) {
                      return BottomSheetComponent.getAkadSerahTerima[index];
                    },
                    itemCount: BottomSheetComponent.getAkadSerahTerima.length,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                ),
              )
            ],
          ),
        );
      },
      showDragHandle: true);
}

class BottomSheetComponent {
  static const List<Widget> getPemesanan = [
    ContentIconBottomSheet(
      enabled: true,
      iconPath: 'assets/icons/utils/svg/booking_fee.svg',
      text: 'Booking\nFee',
      renderBadgeContent: Center(
        child: Text(
          "3",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 10.67,
              fontFamily: 'Outfit'),
        ),
      ),
    ),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/pesanan_belum_bayar.svg',
        text: 'Pesanan\nBelum Bayar'),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/riwayat_pesanan.svg',
        text: 'Riwayat\nPemesanan'),
  ];

  static const List<Widget> getAdministrasi = [
    ContentIconBottomSheet(
      enabled: true,
      iconPath: 'assets/icons/utils/svg/tahap_sps.svg',
      text: 'Tahap\nSPS',
      renderBadgeContent: Center(
        child: Text(
          "!",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Outfit',
              fontSize: 10.67),
        ),
      ),
    ),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_spr.svg',
        text: 'Tahap\nSPR'),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_ppjb.svg',
        text: 'Tahap\nPPJB'),
    ContentIconBottomSheet(
      enabled: false,
      iconPath: 'assets/icons/utils/svg/daftar_dokumen.svg',
      text: 'Daftar\nDokumen',
    ),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_sp3k.svg',
        text: 'Tahap\nSP3K'),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/bayar_angsuran.svg',
        text: 'Bayar\nAngsuran'),
  ];

  static const List<Widget> getPembangunan = [
    ContentPercentageIconBottomSheet(text: 'Tahap\nPersiapan', percentage: 100),
    ContentPercentageIconBottomSheet(
        text: 'Tahap\nPondasi & Struktur', percentage: 20),
    ContentPercentageIconBottomSheet(
        text: 'Tahap\nRumah Unfinished', percentage: 30),
    ContentPercentageIconBottomSheet(
        text: 'Tahap\nFinishing & Interior', percentage: 40),
    ContentPercentageIconBottomSheet(text: 'Tahap\nPembersihan', percentage: 0),
  ];

  static const List<Widget> getAkadSerahTerima = [
    ContentIconBottomSheet(
      enabled: true,
      iconPath: 'assets/icons/utils/svg/tahap_akad.svg',
      text: 'Tahap\nAkad',
      renderBadgeContent: Center(
        child: Text(
          "!",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Outfit',
              fontSize: 10.67),
        ),
      ),
    ),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_serah_terima_bangunan.svg',
        text: 'Tahap\nSerah Terima\nBangunan'),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_serah_terima_legalitas.svg',
        text: 'Tahap\nSerah Terima\nLegalitas'),
    ContentIconBottomSheet(
      enabled: false,
      iconPath: 'assets/icons/utils/svg/daftar_komplain.svg',
      text: 'Daftar\nKomplain',
    ),
  ];
}
