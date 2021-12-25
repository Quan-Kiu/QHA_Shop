import 'package:doan/modules/orders/order_detail_page/components/body.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Chi tiết đơn hàng'),
      body: Body(),
    );
  }
}
