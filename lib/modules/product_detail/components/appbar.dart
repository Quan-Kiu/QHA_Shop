import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar(context, product) {
  return AppBar(
    title: Text(product.name),
    leading: IconButton(
        icon: SvgPicture.asset(AppAssetsPath.leftIcon),
        color: AppColors.grayClr,
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.HOME_PAGE);
        }),
    // actions: [
    //   IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    //   IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
    // ],
  );
}
