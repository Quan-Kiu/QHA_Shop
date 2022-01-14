import 'package:doan/api/my_api.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/models/buttoncate.dart';
import 'package:doan/models/productType.dart';
import 'package:flutter/material.dart';

class ProductTypeProvider extends ChangeNotifier {
  List<dynamic> myProductType = [];
  List<ButtonCate> myButtonCate = [];
  List<String> icons = [
    AppAssetsPath.shirtIcon,
    AppAssetsPath.manshoesIcon,
    AppAssetsPath.manbagIcon,
    AppAssetsPath.skirtIcon,
    AppAssetsPath.womanshoesIcon,
    AppAssetsPath.womanbagIcon,
  ];

  get get => myProductType;
  get getMyButtonCate => myButtonCate;

  getProductType() async {
    if (myProductType.isEmpty) {
      var response = await MyApi().getData('product_type');

      if (response['success'] != null && response['success']) {
        int counter = 0;
        var productType = response['data'].map((data) {
          ProductType productType = ProductType.fromJson(data);
          myButtonCate.add(ButtonCate(
              productType.name, icons[counter], productType.id.toString()));
          counter++;
          return productType;
        }).toList();

        myProductType = productType;
      }
    }
  }
}
