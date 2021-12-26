import 'package:doan/modules/orders/orders_page/components/body.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Đặt hàng'),
      body: Body(),
    );
  }
}
