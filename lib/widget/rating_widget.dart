import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rating extends StatelessWidget {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final star_count;
  final countTextShow;
  final size;
  final onPress;

  // ignore: non_constant_identifier_names

  const Rating(
      {Key? key,
      required this.star_count,
      this.countTextShow = false,
      this.size = "sm",
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = size == 'sm' ? 16.0 : 35.0;
    double textSize = size == 'sm' ? 12.0 : 16.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => GestureDetector(
                child: SvgPicture.asset(
                  AppAssetsPath.starIcon,
                  color: index < star_count
                      ? AppColors.yellowClr
                      : AppColors.lightClr,
                  width: iconSize,
                  height: iconSize,
                ),
                onTap: () {
                  onPress(index);
                },
              ),
            ),
          ),
          countTextShow
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(star_count.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: textSize)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(5 sao)",
                        style: TextStyle(fontSize: textSize),
                      )
                    ],
                  ),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
