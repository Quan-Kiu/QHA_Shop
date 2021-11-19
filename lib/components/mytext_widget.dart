import "package:flutter/material.dart";
import 'package:doan/constants.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool isBold;
  final double fontSize;
  const MyTextWidget({
    Key? key,
    required this.text,
    this.isBold = false,
    this.fontSize = MyTextSize.normalText,
    this.color = MyColor.grayClr,
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
