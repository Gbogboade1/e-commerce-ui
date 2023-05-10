import '../../__lib.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<NavItem> menu = [
    NavItem(
      title: 'Category',
      imagePath: AppAssets.ASSETS_ICONS_CATEGORIES_PNG,
    ),
    NavItem(
      title: 'Flight',
      imagePath: AppAssets.ASSETS_ICONS_FLIGHT_MODE_PNG,
    ),
    NavItem(
      title: 'Bill',
      imagePath: AppAssets.ASSETS_ICONS_NOTEPAD_PNG,
    ),
    NavItem(
      title: 'Data Plan',
      imagePath: AppAssets.ASSETS_ICONS_GLOBE_PNG,
    ),
    NavItem(
      title: 'Top Up',
      imagePath: AppAssets.ASSETS_ICONS_TOP_UP_PNG,
    ),
  ];

  List<NavItem> bannerList = [
    NavItem(
      title: '#FASHION',
      content: '80% OFF',
      subTitle: 'Discover fashion that suits to\nyour style',
      cta: 'Check this out',
      imagePath: AppAssets.ASSETS_BANNERS_HOME_ICON_2_PNG,
    ),
    NavItem(
      title: '#BEAUTYSALE',
      content: 'DISCOVER YOUR \nBEAUTY SELECTION',
      cta: 'Check this out',
      imagePath: AppAssets.ASSETS_BANNERS_HOME_ICON_1_PNG,
    ),
  ];
  late TextEditingController controller;

  late ValueNotifier<bool> _bannerIsOnScreen;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _bannerIsOnScreen = ValueNotifier(true);
  }

  @override
  void dispose() {
    controller.dispose();
    _bannerIsOnScreen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AdvertBannerWidget(
                onVisibilityChanged: (isVisible) {
                  _bannerIsOnScreen.value = isVisible;
                },
                bannerList: bannerList,
              ),
              MenuSectionWidget(appTheme: appTheme, menu: menu),
              SizedBox(
                height: screenHeight(context) - context.scaleH(250),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                      AppColors.navGrey.withOpacity(.1),
                      Colors.white
                    ], radius: 50),
                  ),
                  padding: context.insetsSymetric(horizontal: 16),
                  child: Column(
                    children: [
                      const HGap(24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          RobotoText(
                            'Best Sale Product',
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                          Spacer(),
                          RobotoText(
                            'See more',
                            size: 16,
                            color: AppColors.green,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const HGap(16),
                      const Expanded(child: ProductsGridView()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        HeaderSectionWidget(
          bannerIsOnScreen: _bannerIsOnScreen,
          controller: controller,
        ),
      ],
    );
  }
}
