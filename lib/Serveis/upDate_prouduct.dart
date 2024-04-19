import 'package:dartz/dartz.dart';

import '../helper/api.dart';
import 'Product_modile.dart';

class UpdateProductServis {
  Future<ProductModile> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id ,
  }) async {
    print("product id = $id");
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );

    return ProductModile.fromJson(data);
  }
}
