import 'package:flutter/cupertino.dart';

import '../../../__lib.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({
    super.key,
    required this.appTheme,
    required this.product,
  });

  final BaseTheme appTheme;
  final Product product;

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
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: product.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: AppColors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: AppColors.black,
                  ),
          ),
          const WGap(16),
          Image.asset(
            AppAssets.ASSETS_ICONS_SHARE_PNG,
            color: AppColors.black,
          ),
          const WGap(16),
          const BadgedIcon(
            size: 24,
            iconPath: AppAssets.ASSETS_ICONS_CART_PNG,
            value: '1 ',
          ),
        ],
      ),
    );
  }
}
