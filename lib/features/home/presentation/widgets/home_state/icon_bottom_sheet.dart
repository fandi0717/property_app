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
