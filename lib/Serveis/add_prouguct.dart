import 'package:quran/helper/api.dart';
import 'package:quran/Serveis/Product_modile.dart';

class AddProduct {
  Future<ProductModile> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(url:'https://fakestoreapi.com/products', body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });

    return ProductModile.fromJson(data);
  }
}
