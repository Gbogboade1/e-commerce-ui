import 'package:equatable/equatable.dart';

import '../../__lib.dart';

class Product extends Equatable {
  final String image;
  final String type;
  final String name;
  final double rating;
  final double price;
  final int totalRating;
  final bool isFavorite;
  final Key key;

  const Product({
    this.type = 'Shirt',
    this.name = "Essential Men's Short-Sleeve Crewnect T-Shirt",
    this.rating = 4.9,
    this.price = 12.0,
    this.totalRating = 2356,
    this.isFavorite = false,
    required this.image,
    required this.key,
  });

  @override
  List<Object?> get props => [key];
}
