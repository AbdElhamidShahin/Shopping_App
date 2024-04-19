import 'package:quran/helper/api.dart';
import 'Product_modile.dart';

class ALLBroductService {
  Future<List<ProductModile>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModile> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModile.fromJson(data[i]),
      );
    }
    return productList;
  }
}
