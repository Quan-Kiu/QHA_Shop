import 'package:flutter/material.dart';

class Products extends ChangeNotifier {
  Map<String, dynamic> _myProduct = {
    "products": {},
    "total": '',
  };

  get myValue => _myProduct;

  void update(data) {
    _myProduct = data;
    notifyListeners();
  }
}
