import 'package:doan/modules/product_favorite/screen/components/appbar.dart';
import 'package:doan/modules/product_favorite/screen/components/body.dart';
import 'package:flutter/material.dart';


void main() => runApp(Product_Favorite());

class Product_Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBar(),
        body: body(),
      ),
    );
  }
}



