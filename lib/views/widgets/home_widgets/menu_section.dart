import '../../../__lib.dart';

class MenuSectionWidget extends StatelessWidget {
  const MenuSectionWidget({
    super.key,
    required this.appTheme,
    required this.menu,
  });

  final BaseTheme appTheme;
  final List<NavItem> menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.insetsSymetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: appTheme.shadowColor,
              offset: const Offset(3, 5),
              spreadRadius: 5,
              blurRadius: 5)
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: menu
                .map(
                  (e) => MenuItem(
                    appTheme: appTheme,
                    item: e,
                  ),
                )
                .toList(),
          ),
          const HGap(16),
          const DotIndicator(current: 0)
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.appTheme,
    required this.item,
  });

  final BaseTheme appTheme;
  final NavItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: context.insetsAll(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: appTheme.neutral.c100!.withOpacity(.2),
              ),
              child: Image.asset(
                item.imagePath,
                height: context.scaleW(20),
                width: context.scaleW(20),
                color: AppColors.black,
              ),
            ),
            const HGap(12),
            RobotoText(
              item.title,
              size: 12,
              weight: FontWeight.w300,
            )
          ],
        ),
      ),
    );
  }
}
