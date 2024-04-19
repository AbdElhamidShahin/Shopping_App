import 'package:flutter/material.dart';

import '../Serveis/Product_modile.dart';

class Cart extends ChangeNotifier {
  List<ProductModile> _items = [];
  double _totalPrice = 0.0;

  void add(ProductModile item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(ProductModile item) {
    _items.remove(item);
    _totalPrice -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<ProductModile> get basketItems {
    return _items;
  }
}

class Like extends ChangeNotifier {
  List<ProductModile> _items = [];
  double _totalPrice = 0.0;

  void add(ProductModile item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(ProductModile item) {
    _items.remove(item);
    _totalPrice -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<ProductModile> get basketItems {
    return _items;
  }
}
