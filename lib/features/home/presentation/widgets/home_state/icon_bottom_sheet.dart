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

    /// TODO : wrap [column] with [Container]
    /// and create box decoration
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        badges.Badge(
          badgeContent: renderBadgeContent,
          showBadge: enabled,
          child: CircleAvatar(
            backgroundColor: enabled
                ? const Color.fromARGB(255, 51, 74, 52)
                : const Color.fromARGB(255, 153, 164, 153),
            // radius: 25,
            child: SvgPicture.asset(iconPath),
          ),
        ),
        const Gap(10),
        Text.rich(TextSpan(
            text: text.split('\n')[0],
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: enabled
                    ? const Color.fromARGB(255, 51, 74, 52)
                    : const Color.fromARGB(255, 153, 164, 153)),
            children: [
              TextSpan(
                  text:
                      '\n${text.split('\n')[1]}${text.split('\n').length == 3 ? '\n${text.split('\n')[2]}' : ""}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: enabled
                          ? const Color.fromARGB(255, 51, 74, 52)
                          : const Color.fromARGB(255, 153, 164, 153))),
            ]))
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 51, 74, 52),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2.5,
                    spreadRadius: 0,
                    color:
                        const Color.fromARGB(255, 9, 19, 10).withOpacity(0.16),
                    offset: const Offset(0, 10))
              ]),
          child: SimpleCircularProgressBar(
              // size: 35,
              backStrokeWidth: 3,
              progressStrokeWidth: 3,
              progressColors: const [Color.fromARGB(255, 255, 92, 92)],
              backColor: Colors.white,
              mergeMode: true,
              onGetText: (double value) {
                return Text.rich(TextSpan(
                    text: value.toInt().toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white),
                    children: const [
                      TextSpan(
                          text: '%',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 3.57,
                              color: Colors.white))
                    ]));
              },
              valueNotifier: ValueNotifier(percentage.toDouble())),
        ),
        const Gap(10),
        Text.rich(TextSpan(
            text: text.split('\n')[0],
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: Color.fromARGB(255, 51, 74, 52)),
            children: [
              TextSpan(
                  text:
                      '\n${text.split('\n')[1]}${text.split('\n').length == 3 ? '\n${text.split('\n')[2]}' : ""}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color.fromARGB(255, 51, 74, 52))),
            ]))
      ],
    );
  }
}
