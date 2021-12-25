import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';

import 'mytext_widget.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            ClipOval(
              child: Image.asset(
                AppAssetsPath.banner2Image,
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MyTextWidget(
                    text: "Trương Minh Hiếu",
                    isBold: true,
                    color: AppColors.darkClr,
                    fontSize: 14,
                  ),
                  Rating(
                    star_count: 4,
                  )
                ])
          ]),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "air max luôn rất vừa vặn, sạch sẽ và hoàn hảo về mọi mặt. chỉ là chiếc hộp quá nhỏ và làm cong đôi giày thể thao lên một chút, không chắc chiếc hộp lúc nào cũng nhỏ như thế này không nhưng những năm 90 đang và sẽ luôn là một trong những món đồ yêu thích của tôi.",
            style: AppTextStyles.normalText,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "13/12/2001",
            style: AppTextStyles.smallText,
          )
        ],
      ),
    );
  }
}
