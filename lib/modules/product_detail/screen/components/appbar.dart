import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar(context) {
  return AppBar(
    title: Text("Nike Air Zoom Pegasus 36 Miami"),
    leading: IconButton(
        icon: SvgPicture.asset(AppAssetsPath.leftIcon),
        color: AppColors.grayClr,
        onPressed: () {
          Navigator.pop(context);
        }),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
    ],
  );
}
