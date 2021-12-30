import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card_Payment();
  }
}

class Card_Payment extends StatelessWidget {
  final String cardNumber = '2342-6476-8564-8562';
  const Card_Payment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> number = cardNumber.split('-');
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 199,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
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
          Container(
              padding:
                  const EdgeInsets.only(top: 90.0, left: 18.0, right: 18.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      number.length,
                      (index) => Text(
                            number[index],
                            style: const TextStyle(
                              color: AppColors.whiteClr,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          )))),
          Padding(
              padding: const EdgeInsets.only(top: 140.0, left: 18.0),
              child: Text(
                "CARD HOLDER",
                style: TextStyle(
                    color: AppColors.lightClr,
                    fontSize: 10,
                    letterSpacing: 1.5),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 140.0, left: 130.0),
              child: Text(
                "CARD SAVE",
                style: TextStyle(
                    color: AppColors.lightClr,
                    fontSize: 10,
                    letterSpacing: 1.5),
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
