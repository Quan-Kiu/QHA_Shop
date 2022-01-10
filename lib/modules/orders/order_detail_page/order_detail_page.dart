import 'package:doan/modules/orders/order_detail_page/components/body.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final order;
  const OrderDetail({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Chi tiết đơn hàng', null),
      body: Body(order: order),
    );
  }
}
