class Product {
  final String id;
  final String name;
  final double price;
  final String category;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['p_name'],
      price: json['p_price'],
      category: json['p_category'],
      description: json['p_description'],
      image: json['p_image'],
    );
  }
}