import 'package:doan/api/my_api.dart';
import 'package:doan/models/order.dart';
import 'package:flutter/material.dart';

class OrderStatusProvider extends ChangeNotifier {
  var _orderStatus = [];

  get myOrderStatus => _orderStatus;

  getOrderStatus() async {
    if (_orderStatus.isEmpty) {
      var res = await MyApi().getData('order_status');
      if (res['success'] != null && res['success']) {
        var list =
            res['data'].map((item) => OrderStatus.fromJson(item)).toList();
        _orderStatus = list;
      }
    }
  }
}
