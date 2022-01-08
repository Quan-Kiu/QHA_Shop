import 'package:doan/api/my_api.dart';
import 'package:doan/models/product.dart';
import 'package:flutter/material.dart';

class Products extends ChangeNotifier {
  var _myProduct = [];
  var _myDiscountProduct = [];

  get myValue => _myProduct;
  get myDiscount => _myDiscountProduct;

  getProducts() async {
    if (_myProduct.isEmpty) {
      var response = await MyApi().getData('product');
      if (response['success'] != null && response['success']) {
        var products = response['data']['products']
            .map((data) => Product.fromJson(data))
            .toList();

        _myProduct = products;
        notifyListeners();
      }
    }
  }

  getDiscountProducts() async {
    if (_myDiscountProduct.isEmpty) {
      var response2 = await MyApi().getData('product/discount');
      if (response2['success'] != null && response2['success']) {
        var products = response2['data']['products']
            .map((data) => Product.fromJson(data))
            .toList();
        _myDiscountProduct = products;
        notifyListeners();
      }
    }
  }

  void update(data) {
    _myProduct = data;
    notifyListeners();
  }

  void updateDiscount(data) {
    _myDiscountProduct = data;
    notifyListeners();
  }
}
