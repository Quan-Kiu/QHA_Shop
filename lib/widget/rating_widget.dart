import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rating extends StatelessWidget {
  final star_count;
  const Rating({Key? key, required this.star_count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: List.generate(
          5,
          (index) => SvgPicture.asset(
            AppAssetsPath.starIcon,
            color:
                index < star_count ? AppColors.yellowClr : AppColors.lightClr,
          ),
        ),
      ),
    );
  }
}
