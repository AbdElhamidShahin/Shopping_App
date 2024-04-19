import 'package:quran/helper/api.dart';

import 'package:quran/Serveis/Product_modile.dart';

class CategorisService {
  Future<List<ProductModile>> getCatogryProducts(
      {required String CatogryName}) async {
    List<dynamic> data = await Api()
        .get(url:'https://fakestoreapi.com/products/category/$CatogryName');

    List<ProductModile> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModile.fromJson(data[i]),
      );
    }
    return productList;
  }
}
