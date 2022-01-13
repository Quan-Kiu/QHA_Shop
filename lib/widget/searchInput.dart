import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

PreferredSize searchInput(context, cb) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColors.lightClr, width: 1.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: TextField(
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkClr,
                  fontSize: 16.0),
              onChanged: (query) => cb(query),
              autofocus: true,
              onSubmitted: (value) =>
                  Navigator.pushNamed(context, RoutesName.SEARCH_RESULT),
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sản phẩm',
                prefixIcon: const Icon(Icons.search, color: AppColors.blueClr),
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white70,
                contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blueClr, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(235, 240, 255, 1), width: 1.0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
