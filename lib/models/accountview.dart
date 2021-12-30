import 'package:doan/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class TypeCheckout {
  final String icon, name, router;
  final int id;
  TypeCheckout({
    required this.id,
    required this.icon,
    required this.name,
    required this.router,
  });
}

List<TypeCheckout> type = [
  TypeCheckout(
      id: 1,
      name: "Thông tin cá nhân",
      icon: "Groups.svg",
      router: RoutesName.INFO_PAGE),
  TypeCheckout(
      id: 2,
      name: "Đặt hàng",
      icon: "Carts.svg",
      router: RoutesName.ORDERS_PAGE),
  TypeCheckout(
      id: 2,
      name: "Địa chỉ",
      icon: "Location.svg",
      router: RoutesName.ADDRESS_PAGE),
  TypeCheckout(
      id: 2,
      name: "Thanh toán",
      icon: "Pay.svg",
      router: RoutesName.CHECKOUT_TYPE_PAGE),
];
