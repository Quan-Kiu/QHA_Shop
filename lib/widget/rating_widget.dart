import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rating extends StatelessWidget {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final star_count;
  final countTextShow;

  // ignore: non_constant_identifier_names

  const Rating({Key? key, required this.star_count, this.countTextShow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => SvgPicture.asset(
                AppAssetsPath.starIcon,
                color: index < star_count
                    ? AppColors.yellowClr
                    : AppColors.lightClr,
              ),
            ),
          ),
          countTextShow
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(star_count.toString(),
                          style: AppTextStyles.mediumTextBold),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("(5 sao)", style: AppTextStyles.normalText)
                    ],
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}
