import 'package:flutter/material.dart';

import 'app_colors.dart';

const defaultSpacing = 0.5;

class AppTextStyles {
  // Heading
  static const h1 = TextStyle(
    height: 1.5,
    fontSize: 32,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h2 = TextStyle(
    height: 1.5,
    fontSize: 24,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h3 = TextStyle(
    height: 1.5,
    fontSize: 20,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h4 = TextStyle(
    height: 1.5,
    fontSize: 16,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h5 = TextStyle(
    height: 1.5,
    fontSize: 14,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h6 = TextStyle(
    height: 1.5,
    fontSize: 10,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );

  // Body Text
  static const largeTextBold = TextStyle(
    height: 1.8,
    fontSize: 16,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const largeText = TextStyle(
    height: 1.8,
    fontSize: 16,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );

  static const mediumTextBold = TextStyle(
    height: 1.8,
    fontSize: 14,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const mediumText = TextStyle(
    height: 1.8,
    fontSize: 14,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );
  static const normalTextBold = TextStyle(
    height: 1.5,
    fontSize: 12,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const normalText = TextStyle(
    height: 1.5,
    fontSize: 12,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );
  static const smallTextBold = TextStyle(
    height: 1.5,
    fontSize: 10,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const smallText = TextStyle(
    height: 1.5,
    fontSize: 10,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );
  static const largeLinkText = TextStyle(
      height: 1.5,
      fontSize: 14,
      letterSpacing: defaultSpacing,
      fontWeight: FontWeight.w700,
      color: AppColors.blueClr);
  static const smallLinkText = TextStyle(
      height: 1.5,
      fontSize: 12,
      letterSpacing: defaultSpacing,
      fontWeight: FontWeight.w700,
      color: AppColors.blueClr);
}
