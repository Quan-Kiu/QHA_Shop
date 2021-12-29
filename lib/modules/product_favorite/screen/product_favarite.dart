import 'package:doan/modules/product_favorite/screen/components/body.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class Product_Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Sản phẩm yêu thích'),
      body: body(),
    );
  }
}
