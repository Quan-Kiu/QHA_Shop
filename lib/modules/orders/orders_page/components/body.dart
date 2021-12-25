import 'package:doan/models/order.dart';
import 'package:doan/modules/orders/orders_page/components/order_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  Order order = Order(
    id: 'LQNSU346JK',
    status: 'Đang vận chuyển',
    unitPrice: 6800000,
    total: 3,
    createdAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            OrderItem(
              order: order,
            ),
            OrderItem(
              order: order,
            ),
            OrderItem(
              order: order,
            ),
            OrderItem(
              order: order,
            ),
          ],
        ),
      ),
    );
  }
}
