import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Banner_Discount extends StatelessWidget {
  final String image;
  final String title;
  final String discount;
  const Banner_Discount({
    Key? key,
    required this.image,
    required this.title,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 48,
              left: 42,
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.whiteClr,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              )),
          Positioned(
              top: 96,
              left: 42,
              child: Row(
                children: [
                  Text(
                    discount,
                    style: const TextStyle(
                        color: AppColors.whiteClr,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
