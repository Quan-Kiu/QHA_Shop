import 'package:flutter/material.dart';

class Products extends ChangeNotifier {
  Map<String, dynamic> _myProduct = {
    "products": {},
    "total": '',
  };
  Map<String, dynamic> _myDiscountProduct = {
    "products": {},
  };

  get myValue => _myProduct;
  get myDiscount => _myDiscountProduct;

  void update(data) {
    _myProduct = data;
    notifyListeners();
  }

  void updateDiscount(data) {
    _myDiscountProduct = data;
    notifyListeners();
  }
}
