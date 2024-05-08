import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../data/models/transaction_enum.dart';

part 'build_bottom_sheet.dart';
part 'icon_bottom_sheet.dart';

void showBottomSheetWidget(BuildContext context, Transaction transaction) {
  switch (transaction) {
    case Transaction.pemesanan:
      buildBottomSheet4Pemesanan(context);
    case Transaction.administrasi:
      buildBottomSheet4Administrasi(context);
    case Transaction.pembangunan:
      buildBottomSheet4Pembangunan(context);
    case Transaction.serahTerima:
      buildBottomSheet4AkadSerahTerima(context);
  }
}
