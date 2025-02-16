class RentalItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  RentalItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Convert RentalItem to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Create RentalItem from a Firestore map
  factory RentalItem.fromMap(Map<String, dynamic> map) {
    return RentalItem(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'].toDouble(),
      imageUrl: map['imageUrl'],
    );
  }
}
