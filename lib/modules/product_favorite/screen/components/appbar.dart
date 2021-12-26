import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar() {
  return AppBar(
    title: const Text("Sản phẩm yêu thích",
        style: TextStyle(
            color: AppColors.darkClr,
            fontSize: 16,
            fontWeight: FontWeight.bold)),
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
        icon: SvgPicture.asset(AppAssetsPath.leftIcon),
        color: AppColors.grayClr,
        onPressed: () {
          // Do something.
        }),
  );
}