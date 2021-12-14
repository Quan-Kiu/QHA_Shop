import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import '../constants/assets/app_assets_path.dart';
import 'mytext_widget.dart';

class MyHeaderAuth extends StatelessWidget {
  final String title;
  final String subTitle;
  const MyHeaderAuth({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 27),
          child: Image(
            image: AssetImage(AppAssetsPath.logoImage),
            width: 72,
            height: 72,
          ),
        ),
        MyTextWidget(
          text: title,
          isBold: true,
          fontSize: 16,
          color: AppColors.darkClr,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(subTitle),
      ],
    );
  }
}
