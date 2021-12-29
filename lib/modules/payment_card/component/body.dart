import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/transpost.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/transpost_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class body extends StatelessWidget {
  const body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card_Payment();
  }
}

class Card_Payment extends StatelessWidget {
  final int x = 2342647685648562;
  const Card_Payment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.0),
      width: 344,
      height: 199,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: AppColors.blueClr,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppAssetsPath.LogoCardIcon)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18.0),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppAssetsPath.LogoCardIcon)),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 90.0, left: 18.0),
              child: Text(
                x.toString(),
                style: TextStyle(
                    color: AppColors.whiteClr,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1.5),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 140.0, left: 18.0),
              child: Text(
                "CARD HOLDER",
                style: TextStyle(
                    color: AppColors.grayClr, fontSize: 10, letterSpacing: 1.5),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 140.0, left: 130.0),
              child: Text(
                "CARD SAVE",
                style: TextStyle(
                    color: AppColors.grayClr, fontSize: 10, letterSpacing: 1.5),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 160.0, left: 18.0),
              child: Text(
                "Lailyfa Febrina",
                style: TextStyle(
                    color: AppColors.whiteClr,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 1.5),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 160.0, left: 130.0),
              child: Text(
                "19/2042",
                style: TextStyle(
                    color: AppColors.whiteClr,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 1.5),
              )),
        ],
      ),
    );
  }
}
