import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/product.dart';
import 'package:doan/modules/product_detail/screen/components/product_main_infos.dart';
import 'package:doan/modules/product_detail/screen/components/product_slider.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  Product product = Product(
      "Nike Air Zoom Pegasus 36 Miami",
      680000,
      "Nike Air Max 270 React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      ["image_46.png", "image_47.png", "image_48.png", "image_49.png"],
      1);
  List<String> sizes = ["46", "47", "48", "49", "50", "51", "52", "53"];
  List<String> colors = ["yellow", "blue", "dark", "red", "green"];

  int curentPage = 0;
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
                      ButtonSelect(data: sizes, type: "size"),
                      ButtonSelect(data: colors, type: "color"),
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
          onPress: () {},
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
