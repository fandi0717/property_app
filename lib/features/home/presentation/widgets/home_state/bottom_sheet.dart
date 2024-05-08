import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:property_app/features/home/data/models/transaction_enum.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';

part 'build_bottom_sheet.dart';
part 'icon_bottom_sheet.dart';

void showBottomSheetWidget(BuildContext context, Transaction transaction) {
  switch (transaction) {
    case Transaction.pemesanan:
      buildBottomSheet4Pemesanan(context);
    case Transaction.administrasi:
      buildBottomSheet4Administrasi(context);
    case Transaction.pembangunan:

    /// TODO : implemment
    case Transaction.serahTerima:
      buildBottomSheet4AkadSerahTerima(context);
  }
}
