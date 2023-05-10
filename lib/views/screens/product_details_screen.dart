import 'package:google_fonts/google_fonts.dart';

import '../../__lib.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  bool doAnimation = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 0), () {
        setState(() {
          doAnimation = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductDetailAppBar(appTheme: appTheme, product: widget.product),
            Expanded(
              child: SingleChildScrollView(
                padding: context.insetsOnly(top: 16, left: 16, right: 16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSlide(
                      duration: const Duration(seconds: 1),
                      offset: doAnimation
                          ? const Offset(0, 0)
                          : const Offset(0, .25),
                      child: ImageGalleyView(
                        imagesList: [
                          widget.product.image,
                          ...List.generate(
                              3,
                              (index) =>
                                  'assets/products/shirt_${(index % 6) + 1}.jpeg')
                        ],
                      ),
                    ),
                    const HGap(32),
                    AnimatedSlide(
                      duration: const Duration(seconds: 1),
                      offset: doAnimation
                          ? const Offset(0, 0)
                          : const Offset(0, .25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.store,
                                size: 16,
                                color: AppColors.navGrey,
                              ),
                              const WGap(4),
                              RobotoText(
                                widget.product.type,
                                color: AppColors.navGrey,
                                weight: FontWeight.w500,
                                size: 16,
                              ),
                            ],
                          ),
                          const HGap(6),
                          RobotoText(
                            widget.product.name,
                            weight: FontWeight.w700,
                            size: 24,
                            maxLines: 2,
                          ),
                          const HGap(16),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.star,
                              ),
                              const WGap(4),
                              RobotoText(
                                '${widget.product.rating} Ratings • 2.3k+ Reviews • 2.9k+ Sold',
                                color: AppColors.navGrey,
                                weight: FontWeight.w600,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HGap(24),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                            indicatorColor: AppColors.green,
                            labelColor: AppColors.green,
                            unselectedLabelColor: AppColors.navGrey,
                            labelPadding:
                                context.insetsOnly(left: 16, right: 16),
                            isScrollable: true,
                            labelStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            tabs: const [
                              Tab(text: 'About Item'),
                              Tab(text: 'Reviews')
                            ],
                          ),
                          SizedBox(
                            height: screenHeight(context) / 3,
                            child: const TabBarView(children: [
                              AboutItemView(),
                              SizedBox.shrink(),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProductDetailFooter(
              product: widget.product,
              appTheme: appTheme,
            ),
          ],
        ),
      ),
    );
  }
}
