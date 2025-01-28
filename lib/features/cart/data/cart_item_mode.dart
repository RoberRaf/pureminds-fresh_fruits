import 'package:pure_minds/features/product/data/product_model.dart';

final class CartItemMode extends ProductModel {
  final int quantity;

  CartItemMode({
    required this.quantity,
    required ProductModel prod,
  }) : super(
          id: prod.id,
          name: prod.name,
          price: prod.price,
          image: prod.image,
          description: prod.description,
          rate: prod.rate,
          reviewCount: prod.reviewCount,
          reviews: prod.reviews,
        );

  double get totalPrice => price * quantity;
}
