import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildSecondaryAppBar(context, title, route) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 18.0),
    ),
    bottom: PreferredSize(
        child: Container(
          color: AppColors.lightClr,
          height: 2.0,
        ),
        preferredSize: const Size.fromHeight(1.0)),
    leading: IconButton(
        icon: SvgPicture.asset(AppAssetsPath.leftIcon),
        color: AppColors.grayClr,
        onPressed: () {
          if (route != null) {
            Navigator.pushNamed(context, route['route'],
                arguments: route['arguments']);
          } else {
            Navigator.pop(context);
          }
        }),
  );
}
