import 'package:doan/api/my_api.dart';
import 'package:doan/models/productType.dart';
import 'package:flutter/material.dart';

class ProductTypeProvider extends ChangeNotifier {
  List<dynamic> myProductType = [];

  get get => myProductType;

  getProductType() async {
    if (myProductType.isEmpty) {
      var response = await MyApi().getData('product_type');

      if (response['success'] != null && response['success']) {
        var productType =
            response['data'].map((data) => ProductType.fromJson(data)).toList();

        myProductType = productType;
      }
    }
  }
}
