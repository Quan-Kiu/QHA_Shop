import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBarSearch() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          color: Colors.white,
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
      );
  }
