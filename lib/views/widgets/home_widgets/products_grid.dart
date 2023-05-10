import '../../../__lib.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productsList = ref.watch(productsProvider);
        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 165 / 235,
            mainAxisSpacing: context.scaleW(16),
            crossAxisSpacing: context.scaleW(16),
          ),
          itemCount: 10,
          itemBuilder: (c, i) {
            final item = productsList[i];
            return ProductItemTile(
              addBackgroundColor: i % 3 == 0,
              product: item,
              onTapFavorite: () {
                ref.read(productsProvider.notifier).toggleFavorite(item);
              },
            );
          },
        );
      },
    );
  }
}

class ProductItemTile extends StatelessWidget {
  const ProductItemTile({
    super.key,
    required this.product,
    this.onTapFavorite,
    required this.addBackgroundColor,
  });

  final Function()? onTapFavorite;
  final Product product;
  final bool addBackgroundColor;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProductDetailsScreen(product: product),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInToLinear;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, _createRoute());
      },
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.navGrey.withOpacity(.1), Colors.white],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                  ),
                ),
                child: AssetsImage(
                  product.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: onTapFavorite,
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
              )
            ],
          )),
          Expanded(
              child: Container(
            color: addBackgroundColor ? Colors.white : null,
            padding: context.insetsSymetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HGap(14),
                RobotoText(
                  product.type,
                  color: AppColors.navGrey,
                  weight: FontWeight.w500,
                ),
                const HGap(6),
                RobotoText(
                  product.name,
                  weight: FontWeight.w700,
                  size: 16,
                  maxLines: 2,
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.star,
                    ),
                    const WGap(4),
                    RobotoText(
                      '${product.rating} | ${product.totalRating}',
                      color: AppColors.navGrey,
                    ),
                    Expanded(
                        child: RobotoText(
                      '\$${product.price}',
                      textAlign: TextAlign.end,
                      color: AppColors.green,
                      weight: FontWeight.w700,
                      size: 20,
                    )),
                  ],
                ),
                const HGap(14),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
