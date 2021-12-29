import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/buttoncate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MyButtonCategory extends StatelessWidget {
  final ButtonCate buttonCate;
  const MyButtonCategory({Key? key, required this.buttonCate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Ink(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightClr, width: 1.0),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                buttonCate.icon,
                width: 25.0,
              ),
              color: AppColors.blueClr,
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(buttonCate.label,
            textAlign: TextAlign.center, style: AppTextStyles.normalText)
      ],
    );
  }
}
