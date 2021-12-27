import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/categoryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text(
              category[index].name,
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.75),
            ),
            leading: IconButton(
                icon: SvgPicture.asset(
                    AppAssetsPath.iconProductPath + category[index].icon),
                color: AppColors.grayClr,
                onPressed: () {}),
          );
        });
  }
}
