class ProductModile {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModile rating;
  bool isFavorite; // حقل جديد لتمثيل حالة الإعجاب

  ProductModile({
    required this.category,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.isFavorite,
  });
  factory ProductModile.fromJson(Map<String, dynamic> jsonData) {
    return ProductModile(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toDouble(), // Ensure price is parsed as double
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: RatingModile.fromjson(jsonData['rating']),
      isFavorite: jsonData['isFavorite'] ??
          false, // استخدم isFavorite بدلاً من _isFavorite
    );
  }
}

class RatingModile {
  final double rate;
  final int count;
  RatingModile({required this.rate, required this.count});
  factory RatingModile.fromjson(dynamic jsonData) {
    return RatingModile(
      rate: jsonData['rate'].toDouble(), // Cast rate to double
      count: jsonData['count'] as int, // Cast count to int
    );
  }
}
