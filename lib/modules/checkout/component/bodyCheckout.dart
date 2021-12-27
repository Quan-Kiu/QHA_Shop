import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/checkoutType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class bodyCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: type.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text(
              type[index].name,
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.75),
            ),
            leading: IconButton(
                icon:
                    SvgPicture.asset(AppAssetsPath.iconPath + type[index].icon),
                color: AppColors.grayClr,
                onPressed: () {}),
          );
        });
  }
}
