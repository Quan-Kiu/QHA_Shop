import 'package:flutter/material.dart';

class TransPost {
  final String City, Address;
  final int id, PhoneNumber;

  TransPost({
    required this.id,
    required this.City,
    required this.Address,
    required this.PhoneNumber,
  });
}

List<TransPost> itemTrans = [
  TransPost(
    id: 1,
    Address: "257 Nguyễn Thị Thập Tân Phú Quận 7 ",
    City: "Hồ Chí Minh",
    PhoneNumber: 0868960694,
  ),
  TransPost(
    id: 2,
    Address: "Bình Minh Xã Suối Cát Huyện Xuân Lộc",
    City: "Đồng Nai",
    PhoneNumber: 0868960694,
  ),
  TransPost(
    id: 3,
    Address: "Đâu đó ở Gia Lai",
    City: "Gia Lai",
    PhoneNumber: 0868960694,
  ),
];
