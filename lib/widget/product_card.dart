import 'package:doan/config/routes/routes_name.dart';
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
    var discountPersent =
        (((product.price - product.discount) / product.price) * 100).round();

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
                  Image.network(
                    product.thumbnail,
                    width: 100.0,
                    height: 100.0,
                  ),
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
                  isShowRating
                      ? Rating(star_count: product.rating)
                      : Container(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                AppExtension.moneyFormat(product.discount.toString()),
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
                        AppExtension.moneyFormat(product.price.toString()),
                        style: const TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough)),
                  ),
                  Text(
                    "Giảm $discountPersent%",
                    style: const TextStyle(
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
