import 'package:flutter/material.dart';

import 'app_colors.dart';

const defaultSpacing = 0.5;

class AppTextStyles {
  // Heading
  static const h1 = TextStyle(
    fontSize: 32,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h2 = TextStyle(
    fontSize: 24,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h3 = TextStyle(
    fontSize: 20,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h4 = TextStyle(
    fontSize: 16,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h5 = TextStyle(
    fontSize: 14,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const h6 = TextStyle(
    fontSize: 10,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );

  // Body Text
  static const largeTextBold = TextStyle(
    fontSize: 16,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const largeText = TextStyle(
    fontSize: 16,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );

  static const mediumTextBold = TextStyle(
    fontSize: 14,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const mediumText = TextStyle(
    fontSize: 14,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );
  static const normalTextBold = TextStyle(
    fontSize: 12,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const normalText = TextStyle(
    fontSize: 12,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );
  static const smallTextBold = TextStyle(
    fontSize: 10,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w700,
  );
  static const smallText = TextStyle(
    fontSize: 10,
    letterSpacing: defaultSpacing,
    fontWeight: FontWeight.w400,
  );
  static const largeLinkText = TextStyle(
      fontSize: 14,
      letterSpacing: defaultSpacing,
      fontWeight: FontWeight.w700,
      color: AppColors.blueClr);
  static const smallLinkText = TextStyle(
      fontSize: 12,
      letterSpacing: defaultSpacing,
      fontWeight: FontWeight.w700,
      color: AppColors.blueClr);
}
