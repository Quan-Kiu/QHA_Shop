import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/product.dart';
import 'package:doan/widget/product_card.dart';
import 'package:flutter/material.dart';

class BodySearchResult extends StatelessWidget {
  const BodySearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        color: AppColors.whiteClr,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: .55,
              children: [
                Text('aa'),
              ]),
        ),
      ),
    );
  }
}
