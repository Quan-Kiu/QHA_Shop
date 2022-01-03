import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/product.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isShowRating;
  const ProductCard({Key? key, required this.product, this.isShowRating = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutesName.PRODUCT_DETAIL_PAGE,
          arguments: product),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightClr, width: 2)),
        child: Column(
          children: [
            SizedBox(
              width: isShowRating ? 135.0 : 100.0,
              child: Column(
                children: [
                  Image.network(product.images[0]),
                  const SizedBox(height: 10.0),
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: AppColors.darkClr),
                  ),
                  isShowRating ? const Rating(star_count: 4) : Container(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                AppExtension.moneyFormat(product.price.toString()),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueClr,
                  fontSize: 15.0,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                        AppExtension.moneyFormat(product.discount.toString()),
                        style: const TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough)),
                  ),
                  const Text(
                    "Giảm 24%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.redClr),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
