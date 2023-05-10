import '../__lib.dart';

final productsProvider = StateNotifierProvider<ProductsProvider, List<Product>>(
  (ref) => ProductsProvider([]),
);

class ProductsProvider extends StateNotifier<List<Product>> {
  ProductsProvider(super.state) {
    generateProducts();
  }

  generateProducts() {
    final items = List.generate(
        20,
        (index) => Product(
            image: 'assets/products/shirt_${(index % 6) + 1}.jpeg',
            key: UniqueKey()));
    state = items;
  }

  toggleFavorite(Product product) {
    final updateItems = state.map((Product e) {
      if (e == product) {
        e = Product(image: e.image, key: e.key, isFavorite: !e.isFavorite);
      }
      return e;
    }).toList();

    state = updateItems;
  }
}
