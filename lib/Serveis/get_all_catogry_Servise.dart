
import 'package:quran/helper/api.dart';

class AllCatogryServise {
  Future<List<dynamic>> getAllCateogires() async {
    List<dynamic> data =
        await Api().get(url:'https://fakestoreapi.com/products/categories');

    return data;
  }
}
