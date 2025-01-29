class ProductModel {
  final int id;
  final String name;
  final String catName;
  final String description;
  final double price;
  final String image;
  final double rate;
  final int reviewCount;
  final List<String> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.catName,
    required this.description,
    required this.price,
    required this.image,
    required this.rate,
    required this.reviewCount,
    required this.reviews,
  });
}
