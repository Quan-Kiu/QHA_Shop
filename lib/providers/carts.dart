import 'package:doan/api/my_api.dart';
import 'package:doan/models/carts.dart';
import 'package:doan/models/product.dart';
import 'package:flutter/material.dart';

class CartsProvider extends ChangeNotifier {
  List myCart = [];
  bool isFirst = false;

  get getMyCart => myCart;

  isExist(data) {
    for (var i = 0; i < myCart.length; i++) {
      if (myCart[i].product.id == data['product_id'] &&
          myCart[i].description == data['description']) {
        return true;
      }
    }
    return false;
  }

  getCart() async {
    if (!isFirst) {
      var response = await MyApi().getData('cart/getCartByUser');
      if (response['success'] != null && response['success']) {
        List carts = response['data'].map((data) {
          var cart = Cart.fromJson(data);
          return cart;
        }).toList();
        myCart = carts;
        isFirst = true;
      }
    }
  }

  set(data) {
    myCart = data;
  }

  void add(data) {
    myCart.add(data);
    notifyListeners();
  }

  void delete(data) {
    myCart.remove(data);
    notifyListeners();
  }

  void update(data) {
    var index = myCart.indexWhere((element) => element.id == data.id);
    myCart[index] = data;
    notifyListeners();
  }
}