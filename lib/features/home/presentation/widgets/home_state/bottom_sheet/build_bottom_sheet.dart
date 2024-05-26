// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_sheet.dart';

buildBottomSheet4Pemesanan(BuildContext context) {
  return renderBottomSheet(
      context: context,
      title: 'Tahap Pemesanan',
      subtitle: 'Daftar menu tahap pemesanan',
      contents: BottomSheetComponent.getPemesanan);
}

buildBottomSheet4Administrasi(BuildContext context) {
  return renderBottomSheet(
      context: context,
      title: 'Tahap Administrasi',
      subtitle: 'Daftar menu tahap administrasi',
      contents: BottomSheetComponent.getAdministrasi);
}

buildBottomSheet4Pembangunan(BuildContext context) {
  return renderBottomSheet(
      context: context,
      title: 'Tahap Pembangunan',
      subtitle: 'Daftar menu tahap pembangunan rumah',
      contents: BottomSheetComponent.getPembangunan);
}

buildBottomSheet4AkadSerahTerima(BuildContext context) {
  return renderBottomSheet(
      context: context,
      title: 'Tahap Akad & Serah Terima',
      subtitle: 'Daftar menu tahap akad & serah terima',
      contents: BottomSheetComponent.getAkadSerahTerima);
}

class BottomSheetComponent {
  static const List<Widget> getPemesanan = [
    ContentIconBottomSheet(
      enabled: true,
      iconPath: 'assets/icons/utils/svg/booking_fee.svg',
      text: 'Booking\nFee',
      renderBadgeContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Center(
          child: Text(
            "3",
            style: TextStyle(
                color: c.RGB255_O1,
                fontWeight: FontWeight.w500,
                fontSize: 10.67,
                height: 13.44 / 10.67,
                fontFamily: f.Outfit),
          ),
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
      renderBadgeContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Center(
          child: Text(
            "!",
            style: TextStyle(
                color: c.RGB255_O1,
                fontWeight: FontWeight.w500,
                fontFamily: f.Outfit,
                fontSize: 10.67,
                height: 13.44 / 10.67),
          ),
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
      renderBadgeContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Center(
          child: Text(
            "!",
            style: TextStyle(
                color: c.RGB255_O1,
                fontWeight: FontWeight.w500,
                fontFamily: f.Outfit,
                fontSize: 10.67,
                height: 13.44 / 10.67),
          ),
        ),
      ),
    ),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_serah_terima_bangunan.svg',
        text: 'Tahap\nSerah Terima Bangunan'),
    ContentIconBottomSheet(
        enabled: false,
        iconPath: 'assets/icons/utils/svg/tahap_serah_terima_legalitas.svg',
        text: 'Tahap\nSerah Terima Legalitas'),
    ContentIconBottomSheet(
      enabled: false,
      iconPath: 'assets/icons/utils/svg/daftar_komplain.svg',
      text: 'Daftar\nKomplain',
    ),
  ];
}
