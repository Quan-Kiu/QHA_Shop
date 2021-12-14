import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        width: 280,
        color: Colors.white,
        child: Container(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Tìm kiếm sản phẩm',
              prefixIcon: const Icon(Icons.search, color: Colors.blue),
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.favorite_border),
          color: Colors.grey,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          color: Colors.grey,
          onPressed: () {},
        )
      ]);
}
