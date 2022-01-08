import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/checkoutType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class bodyCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: checkoutType.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              if (checkoutType[index].router != '') {
                Navigator.pushNamed(context, checkoutType[index].router);
              }
            },
            title: Text(
              checkoutType[index].name,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.75),
            ),
            leading: IconButton(
                icon: SvgPicture.asset(
                    AppAssetsPath.iconPath + checkoutType[index].icon),
                color: AppColors.grayClr,
                onPressed: () {}),
          );
        });
  }
}
