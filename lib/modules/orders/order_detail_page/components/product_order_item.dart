import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/product.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

class ProductOrderItem extends StatelessWidget {
  final Product product;
  const ProductOrderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightClr, width: 1.0)),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child: Image.asset(AppAssetsPath.imagePath + product.images[0]),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                  text: product.name,
                  isBold: true,
                  color: AppColors.darkClr,
                  fontSize: 16.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  AppExtension.moneyFormat(product.price.toString()),
                  style: AppTextStyles.largeLinkText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
