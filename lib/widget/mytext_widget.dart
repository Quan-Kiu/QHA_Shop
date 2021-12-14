import 'package:doan/constants/themes/app_colors.dart';
import "package:flutter/material.dart";

class MyTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool isBold;
  final double fontSize;
  const MyTextWidget({
    Key? key,
    required this.text,
    this.isBold = false,
    this.fontSize = 12,
    this.color = AppColors.grayClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          color: color,
          fontSize: fontSize,
        ));
  }
}
