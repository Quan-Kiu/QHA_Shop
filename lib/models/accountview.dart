import 'package:flutter/material.dart';

class TypeCheckout {
  final String icon, name;
  final int id;
  TypeCheckout({
    required this.id,
    required this.icon,
    required this.name,
  });
}

List<TypeCheckout> type = [
  TypeCheckout(
    id: 1,
    name: "Thông tin cá nhân",
    icon: "Groups.svg",
  ),
  TypeCheckout(
    id: 2,
    name: "Đặt hàng",
    icon: "Carts.svg",
  ),
  TypeCheckout(
    id: 2,
    name: "Địa chỉ",
    icon: "Location.svg",
  ),
  TypeCheckout(
    id: 2,
    name: "Thanh toán",
    icon: "Pay.svg",
  ),
];
