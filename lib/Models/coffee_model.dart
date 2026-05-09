class CoffeeModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final String type;
  final String description;
  final bool isAvailable;

  CoffeeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.description,
    this.isAvailable = true,
  });

  factory CoffeeModel.fromMap(Map<String, dynamic> map, String id) {
    return CoffeeModel(
      id: id,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      isAvailable: map['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'type': type,
      'description': description,
      'isAvailable': isAvailable,
    };
  }
}
