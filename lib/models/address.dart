import 'package:flutter/material.dart';

class Infor {
  final String City, Address;
  final int id, PhoneNumber;

  Infor({
    required this.id,
    required this.City,
    required this.Address,
    required this.PhoneNumber,
  });
}

List<Infor> itemInfor = [
  Infor(
    id: 1,
    Address: "257 Nguyễn Thị Thập Tân Phú Quận 7 ",
    City: "Hồ Chí Minh",
    PhoneNumber: 0868960694,
  ),
  Infor(
    id: 2,
    Address: "Bình Minh Xã Suối Cát Huyện Xuân Lộc",
    City: "Đồng Nai",
    PhoneNumber: 0868960694,
  ),
];
