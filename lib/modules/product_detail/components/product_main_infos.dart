import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductMainInfos extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  const ProductMainInfos({Key? key, this.product}) : super(key: key);
  @override
  _ProductMainInfosState createState() => _ProductMainInfosState();
}

class _ProductMainInfosState extends State<ProductMainInfos> {
  bool _isLike = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.product.name,
                style: const TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _isLike = !_isLike;
                  });
                },
                icon: SvgPicture.asset(
                  AppAssetsPath.likeIcon,
                  color: _isLike ? AppColors.redClr : AppColors.grayClr,
                ))
          ],
        ),
        Rating(star_count: widget.product.rating),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(AppExtension.moneyFormat(widget.product.price.toString()),
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: AppColors.blueClr,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
      ],
    );
  }
}
