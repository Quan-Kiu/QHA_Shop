import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final bool isSelected;
  const ColorDot({Key? key, this.isSelected = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.blueClr : AppColors.lightClr),
    );
  }
}
