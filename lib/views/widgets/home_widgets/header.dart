
import '../../../__lib.dart';

class HeaderSectionWidget extends StatelessWidget {
  const HeaderSectionWidget({
    super.key,
    required ValueNotifier<bool> bannerIsOnScreen,
    required this.controller,
  }) : _bannerIsOnScreen = bannerIsOnScreen;

  final ValueNotifier<bool> _bannerIsOnScreen;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _bannerIsOnScreen,
        builder: (_, bool value, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: value ? null : Colors.white,
            ),
            padding: context.insetsSymetric(horizontal: 16, vertical: 24),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Expanded(
                    child: SearchFormField(
                        controller: controller, hintText: 'Search...'),
                  ),
                  const WGap(16),
                  const BadgedIcon(
                    iconPath: AppAssets.ASSETS_ICONS_CART_PNG,
                    value: '1 ',
                  ),
                  const WGap(16),
                  const BadgedIcon(
                    iconPath: AppAssets.ASSETS_ICONS_CHAT_PNG,
                    value: '9+',
                  ),
                ],
              ),
            ),
          );
        });
  }
}

