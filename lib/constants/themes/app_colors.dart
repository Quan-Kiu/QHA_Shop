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

  static getColor(color) {
    switch (color) {
      case "blue":
        return blueClr;
      case "red":
        return redClr;
      case "yellow":
        return yellowClr;
      case "green":
        return greenClr;
      case "purple":
        return purpleClr;
      case "dark":
        return darkClr;
      case "gray":
        return grayClr;
      case "light":
        return lightClr;
      case "white":
        return whiteClr;
      case "black":
        return blackClr;
      default:
        return whiteClr;
    }
  }
}
