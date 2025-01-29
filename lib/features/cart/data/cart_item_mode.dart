import 'package:pure_minds/features/product/data/product_model.dart';

final class CartItemModel extends ProductModel {
  int quantity;

  CartItemModel({
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
          catName: prod.catName,
        );

  double get totalPrice => price * quantity;
}
