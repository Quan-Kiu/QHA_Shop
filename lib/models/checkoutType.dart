import 'package:flutter/material.dart';

class TypeCheckout {
  final String icon, name;
  final int  id;
  TypeCheckout({
    required this.id,
    required this.icon,
    required this.name,
  });
}

List<TypeCheckout> type = [
  TypeCheckout(
      id: 1,
      name: "Thẻ tín dụng hoặc thẻ ghi nợ",
      icon: "Bank.svg",
      ),
  TypeCheckout(
      id: 2,
      name: "Ngân hàng nội địa",
      icon: "Group.svg",
      ),
    
];


