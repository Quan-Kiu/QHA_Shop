import 'package:doan/modules/cart/components/body.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Giỏ hàng của bạn'),
      body: const Body(),
    );
  }
}
