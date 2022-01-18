import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/carts.dart';
import 'package:doan/models/product.dart';
import 'package:doan/modules/product_detail/components/product_main_infos.dart';
import 'package:doan/modules/product_detail/components/product_slider.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/utils/alert.dart';

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
                            size = selected;
                          }),
                      ButtonSelect(
                          data: product.colors,
                          type: "color",
                          handle: (selected) {
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
                            fontSize: 16.0,
                            color: MyColor.darkClr,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(product.description,
                              style: AppTextStyles.largeText)
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
                                fontSize: 16.0),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.COMMENT_PAGE,
                                  arguments: {
                                    "product": product,
                                    "rating": null
                                  },
                                );
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
                      product.comments.length > 0
                          ? Column(
                              children: List.generate(
                                  product.comments.length,
                                  (index) => CommentItem(
                                      comment: product.comments[index])),
                            )
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Không có đánh giá nào',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
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
          onPress: () async {
            if (product.stock <= 0)
              return AlertMessage.showMsg(context,
                  'Sản phẩm này hiện đã hết hàng, vui lòng quay trở lại sau.');
            var newCart = {
              "product_id": product.id,
              "quantity": 1,
              "description": "size: $size, color: $color",
            };
            bool isExist = Provider.of<CartsProvider>(context, listen: false)
                .isExist(newCart);
            if (isExist) {
              return AlertMessage.showMsg(
                  context, 'Sản phẩm này đã tồn tại trong giỏ hàng.');
            }
            var response = await MyApi().postData(newCart, 'cart');

            if (response['success'] != null && response['success']) {
              Cart myCart = Cart.fromJson(response['data']);
              context.read<CartsProvider>().add(myCart);
              return Navigator.pushNamed(context, RoutesName.CART_PAGE);
            } else {
              return AlertMessage.showMsg(context, response['message']);
            }
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
