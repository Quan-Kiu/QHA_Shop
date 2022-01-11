import 'package:doan/modules/cart/components/body.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Giỏ hàng của bạn', null),
      body: const Body(),
    );
  }
}
