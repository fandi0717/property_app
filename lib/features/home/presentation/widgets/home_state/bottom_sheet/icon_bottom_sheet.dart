// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_sheet.dart';

class ContentIconBottomSheet extends StatelessWidget {
  const ContentIconBottomSheet({
    super.key,
    required this.enabled,
    required this.iconPath,
    required this.text,
    this.renderBadgeContent,
  });

  final bool enabled;
  final String iconPath;
  final String text;
  final Widget? renderBadgeContent;

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      assert(renderBadgeContent != null,
          "if [enabled] argument is `true`\nYou must declare [renderBadgeContent] argument is not null");
    }

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        // height: 108,
        padding: const EdgeInsets.all(15),
        decoration: enabled
            ? const BoxDecoration(
                color: c.RGB248_O1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                      50.0), // Membuat sudut kanan atas menjadi lingkaran
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ))
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 10,
          children: [
            Container(
              decoration: const BoxDecoration(
                  // color: c.R51_G74_B52_O1,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4.58,
                        spreadRadius: 0,
                        color: c.R234_G230_B230_O073,
                        offset: Offset(0, 6.25))
                  ]),
              child: badges.Badge(
                badgeContent: renderBadgeContent,
                showBadge: enabled,
                child: CircleAvatar(
                  // backgroundColor: enabled
                  //     ? c.R51_G74_B52_O1
                  //     : const Color.fromARGB(255, 153, 164, 153),
                  backgroundColor: c.R51_G74_B52_O1,
                  // radius: 25,
                  child: SvgPicture.asset(iconPath),
                ),
              ),
            ),
            const Gap(10),
            Text.rich(TextSpan(
                text: text.split('\n')[0],
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: f.Lexend,
                    fontSize: 10,
                    color: c.R51_G74_B52_O1),
                children: [
                  TextSpan(
                      text: '\n${text.split('\n')[1]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: f.Lexend,
                          fontSize: 10,
                          color: c.R51_G74_B52_O1)),
                ]))
          ],
        ),
      ),
    );
  }
}

class ContentPercentageIconBottomSheet extends StatelessWidget {
  const ContentPercentageIconBottomSheet({
    super.key,
    required this.text,
    required this.percentage,
  });

  final String text;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    // var textSplitEnter = text.split('\n');
    // var textSplitAnd = text.split('&');

    return Container(
      decoration: const BoxDecoration(
        color: c.RGB248_O1,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
              50.0), // Membuat sudut kanan atas menjadi lingkaran
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

        /*
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Warna bayangan
            spreadRadius:
                -10.0, // Negatif spread radius untuk membatasi bayangan ke dalam
            blurRadius: 10.0, // Kekaburan bayangan
            offset: const Offset(-10, -10), // Posisi bayangan
          ),
        ]
        */
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // spacing: 10,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
                color: c.R51_G74_B52_O1,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.5,
                      spreadRadius: 0,
                      color: c.R9_G19_B10_O016,
                      offset: Offset(0, 5))
                ]),
            child: SimpleCircularProgressBar(
                // size: 35,
                backStrokeWidth: 3,
                progressStrokeWidth: 3,
                progressColors: const [c.R255_G92_B92_O1],
                backColor: c.RGB255_O1,
                mergeMode: true,
                onGetText: (double value) {
                  return Text.rich(TextSpan(
                      text: value.toInt().toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          fontFamily: f.Rubix,
                          color: c.RGB255_O1),
                      children: const [
                        TextSpan(
                            text: '%',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 3.57,
                                fontFamily: f.Rubix,
                                color: c.RGB255_O1))
                      ]));
                },
                valueNotifier: ValueNotifier(percentage.toDouble())),
          ),
          const Gap(10),

          /*
          AutoSizeText.rich(
            TextSpan(
                text: text.split('\n')[0],
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    fontFamily: f.Lexend,
                    color: c.R51_G74_B52_O1),
                children: [
                  TextSpan(
                      text: '\n${text.split('\n')[1]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: f.Lexend,
                          color: c.R51_G74_B52_O1)),
                ]),
            maxLines: 5,
            minFontSize: 10,
            overflow: TextOverflow.ellipsis,
          ),
*/

          Text.rich(TextSpan(
              text: text.split('\n')[0],
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  fontFamily: f.Lexend,
                  color: c.R51_G74_B52_O1),
              children: [
                TextSpan(
                    text: '\n${text.split('\n')[1]}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: f.Lexend,
                        color: c.R51_G74_B52_O1)),
              ]))
        ],
      ),
    );
  }
}
