import 'package:flutter/material.dart';

class CartsProvider extends ChangeNotifier {
  List myCart = [];

  get getMyCart => myCart;

  void add(data) {
    myCart.add(data);
    notifyListeners();
  }

  void delete(data) {
    myCart.remove(data);
    notifyListeners();
  }

  void update(current, type, data) {
    var index = myCart.indexWhere((element) => element == current);
    myCart[index] = {...myCart[index], type: data};
    notifyListeners();
  }
}
