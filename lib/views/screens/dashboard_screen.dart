import '../../__lib.dart';

final dashboardIndexProvider = StateProvider<int>((ref) => 0);

class DahboardScreen extends StatelessWidget {
  const DahboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NavItem> items = [
      NavItem(
        title: 'Home',
        selectedImgPath: AppAssets.ASSETS_NAVIGATION_HOME_SEL_PNG,
        unselectedImgPath: AppAssets.ASSETS_NAVIGATION_HOME_UN_PNG,
      ),
      NavItem(
        title: 'Voucher',
        selectedImgPath: AppAssets.ASSETS_NAVIGATION_TICKET_PNG,
        unselectedImgPath: AppAssets.ASSETS_NAVIGATION_TICKET_PNG,
      ),
      NavItem(
        title: 'Wallet',
        selectedImgPath: AppAssets.ASSETS_NAVIGATION_WALLET_PNG,
        unselectedImgPath: AppAssets.ASSETS_NAVIGATION_WALLET_PNG,
      ),
      NavItem(
        title: 'Settings',
        selectedImgPath: AppAssets.ASSETS_NAVIGATION_SETTING_PNG,
        unselectedImgPath: AppAssets.ASSETS_NAVIGATION_SETTING_PNG,
      ),
    ];
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 64,
          child: Consumer(
            builder: (context, ref, child) {
              final currentIndex = ref.watch(dashboardIndexProvider);
              return Row(
                children: List.generate(
                  items.length,
                  (index) {
                    final item = items[index];
                    return Expanded(
                      child: Column(
                        children: [
                          const HGap(8),
                          AssetsImage(
                            item.selectedImgPath,
                          ),
                          const HGap(8),
                          RobotoText(
                            item.title,
                            weight: FontWeight.w600,
                            color: currentIndex == index
                                ? AppColors.black
                                : AppColors.navGrey,
                          ),
                          const Spacer()
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
