class Product {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavorite = false});
}
