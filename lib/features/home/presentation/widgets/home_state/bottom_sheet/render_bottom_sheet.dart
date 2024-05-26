part of 'bottom_sheet.dart';

/// [renderBottomSheet]
///
/// parameters :
/// 1.  `*required {BuildContext}`
///
/// 2.  `*required {title}` ex : "Tahap Pemesanan"
///
/// 3.  `*required {subtitle}` ex : "Daftar menu tahap pemesanan"
///
/// 4.  `*required {contents}` --> List content of bottom sheet
void renderBottomSheet(
    {required BuildContext context,
    required String title,
    required String subtitle,
    required List<Widget> contents}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: c.RGB255_O1,
      elevation: 0,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: c.RGB255_O1,
          // color: const c.R222_G221_B221_O1,
          // padding:
          //     const EdgeInsets.only(top: 20, right: 10, bottom: 15, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 22.68 / 18,
                    fontFamily: f.Outfit,
                    color: c.R51_G74_B52_O1),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: f.Outfit,
                    height: 15.12 / 12,
                    fontSize: 12,
                    color: c.RGB155_O1),
              ),
              const Gap(2),
              const Divider(
                color: c.R222_G221_B221_O1,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: DynamicHeightGridView(
                    // rowCrossAxisAlignment: CrossAxisAlignment.center,
                    builder: (context, index) {
                      return contents[index];
                    },
                    itemCount: contents.length,
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
