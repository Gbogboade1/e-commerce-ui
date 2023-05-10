import '../../../__lib.dart';

class ProductDetailFooter extends StatelessWidget {
  const ProductDetailFooter({
    super.key,
    required this.product,
    required this.appTheme,
  });

  final Product product;
  final BaseTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: appTheme.shadowColor,
              offset: const Offset(3, -5),
              spreadRadius: 5,
              blurRadius: 5)
        ],
      ),
      padding: context.insetsOnly(left: 16, right: 16, bottom: 12, top: 18),
      child: Row(
        children: [
          Column(
            children: [
              const RobotoText(
                'Total Price',
                color: AppColors.navGrey,
              ),
              const HGap(4),
              RobotoText(
                '\$${product.price}',
                textAlign: TextAlign.end,
                color: AppColors.green,
                weight: FontWeight.w700,
                size: 24,
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: context.scaleH(48),
            padding: context.insetsSymetric(horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                bottomLeft: Radius.circular(3),
              ),
              color: AppColors.green,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.ASSETS_ICONS_CART_PNG,
                  color: Colors.white,
                  height: 20,
                  width: 20,
                ),
                const WGap(4),
                const RobotoText(
                  '1',
                  color: Colors.white,
                  size: 18,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            height: context.scaleH(48),
            padding: context.insetsSymetric(horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
              color: AppColors.black,
            ),
            child: const Center(
              child: RobotoText(
                'Buy Now',
                color: Colors.white,
                size: 18,
                weight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
