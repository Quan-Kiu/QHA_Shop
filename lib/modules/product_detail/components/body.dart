import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/product.dart';
import 'package:doan/modules/product_detail/components/product_main_infos.dart';
import 'package:doan/modules/product_detail/components/product_slider.dart';
import 'package:doan/providers/carts.dart';

import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/comment_item_widget.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

// ignore: must_be_immutable

class Body extends StatelessWidget {
  final Product product;
  Body({Key? key, required this.product}) : super(key: key);

  int curentPage = 0;
  String size = '';
  String color = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductSlider(images: product.images),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductMainInfos(
                        product: product,
                      ),
                      ButtonSelect(
                          data: product.sizes,
                          type: "size",
                          handle: (selected) {
                            print(selected);
                            size = selected;
                          }),
                      ButtonSelect(
                          data: product.colors,
                          type: "color",
                          handle: (selected) {
                            print(selected);
                            color = selected;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyTextWidget(
                            text: "Chi tiết",
                            isBold: true,
                            fontSize: 14,
                            color: MyColor.darkClr,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(product.description,
                              style: AppTextStyles.normalText)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MyTextWidget(
                                text: "Đánh giá",
                                isBold: true,
                                color: AppColors.darkClr,
                                fontSize: MyTextSize.mediumText),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RoutesName.COMMENT_PAGE);
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text("Xem thêm"),
                            )
                          ],
                        ),
                      ),
                      Rating(star_count: product.rating, countTextShow: true),
                      CommentItem(),
                      CommentItem(),
                      CommentItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        MyButtonWidget(
          color: AppColors.blueClr,
          width: double.infinity,
          text: "Thêm vào giỏ hàng",
          onPress: () {
            var newCart = {
              "product": product,
              "total": 1,
              "description": "size: $size,color: $color",
            };
            context.read<CartsProvider>().add(newCart);
            Navigator.pushNamed(context, RoutesName.CART_PAGE);
          },
          textStyle: const TextStyle(
              color: AppColors.whiteClr,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          padding: const EdgeInsets.all(15),
        ),
      ],
    );
  }
}
