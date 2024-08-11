class ProductEntity {
  final String id;
  final String name;
  final String description;
  final num price;
  final num discount;
  final int quantity;
  final String tags;
  final String imageUrl;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.tags,
    required this.quantity,
  });
}