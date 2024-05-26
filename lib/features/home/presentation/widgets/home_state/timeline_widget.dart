// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';

import '../../../../../core/res/color.dart' as c;
import '../../../../../core/res/font.dart' as f;
import '../../../data/models/transaction_enum.dart';

class ProcessTimelinePage extends StatelessWidget {
  const ProcessTimelinePage({
    super.key,
    required this.transaction,
  });

  final Map<Transaction, double> transaction;

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      // physics: const NeverScrollableScrollPhysics(),
      theme: TimelineThemeData(
          direction: Axis.horizontal, nodePosition: 0, indicatorPosition: 0),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (context, index) {
          return MediaQuery.of(context).size.width / (transaction.length + 1);
        },
        contentsBuilder: (context, index) {
          return Text(
            _processes[index],
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                height: 12.6 / 10,
                fontFamily: f.Outfit,
                color: transaction.values.toList()[index] == 0
                    ? c.RGB171_O1
                    : c.R51_G74_B52_O1
                // color: getColor(index),
                ),
          );
        },
        indicatorBuilder: (context, index) {
          if (transaction.values.toList()[index] == 100) {
            return SvgPicture.asset('assets/icons/utils/svg/checklist.svg');
          } else if (transaction.values.toList()[index] == 0) {
            return SvgPicture.asset('assets/icons/utils/svg/cd.svg');
          } else {
            return SvgPicture.asset('assets/icons/utils/svg/half_clock.svg');
          }
        },
        connectorBuilder: (context, index, type) {
          if (transaction.values.toList()[index - 1] < 100) {
            return const DashedLineConnector(
              color: c.RGB171_O1,
              // thickness: 0.5,
            );
          }
          return const SolidLineConnector(
            color: c.R51_G74_B52_O1,
          );
        },
        lastConnectorBuilder: (context) {
          return const DashedLineConnector(
            color: c.RGB171_O1,
            // thickness: 0.5,
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}

final _processes = [
  'Pemesanan',
  'Administrasi',
  'Pembangunan',
  'Serah Terima',
];
