import 'package:flutter/material.dart';

class AppColors {
  static const blueClr = Color.fromRGBO(64, 191, 255, 1);
  static const redClr = Color.fromRGBO(251, 113, 129, 1);
  static const yellowClr = Color.fromRGBO(255, 200, 51, 1);
  static const greenClr = Color.fromRGBO(83, 209, 182, 1);
  static const purpleClr = Color.fromRGBO(92, 97, 244, 1);
  static const darkClr = Color.fromRGBO(34, 50, 99, 1);
  static const grayClr = Color.fromRGBO(144, 152, 177, 1);
  static const lightClr = Color.fromRGBO(235, 240, 255, 1);
  static const whiteClr = Color.fromRGBO(255, 255, 255, 1);
  static const blackClr = Color.fromRGBO(0, 0, 0, 1);
  static const pinkClr = Color.fromRGBO(255, 182, 193, 1);
  static const orangeClr = Color.fromRGBO(255, 165, 0, 1);

  static getColor(color) {
    switch (color) {
      case "Xanh da trời":
        return blueClr;
      case "Đỏ":
        return redClr;
      case "Vàng":
        return yellowClr;
      case "Xanh lá":
        return greenClr;
      case "Tím":
        return purpleClr;
      case "Xanh đen":
        return darkClr;
      case "Xám":
        return grayClr;
      case "light":
        return lightClr;
      case "Trắng":
        return lightClr;
      case "Đen":
        return blackClr;
      case "Hồng":
        return pinkClr;
      case "Cam":
        return orangeClr;
      default:
        return whiteClr;
    }
  }
}
