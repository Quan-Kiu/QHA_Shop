import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar() {
  return AppBar(
      title: const Text(
        "Siêu giảm giá",
        style: TextStyle(color: Colors.blueGrey),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.grey,
          onPressed: () {},
        ),
      ]);
}
