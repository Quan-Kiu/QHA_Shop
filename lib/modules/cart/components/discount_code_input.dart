import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DiscountCodeInput extends StatelessWidget {
  const DiscountCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Stack(
        children: [
          SizedBox(
            height: 57,
            child: TextFormField(
                style: AppTextStyles.mediumTextBold,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 20.0, 120.0, 20.0),
                    hintText: 'Nhập mã giảm giá',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 14.0),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.blueClr, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 240, 255, 1),
                            width: 2.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ))),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: MyButtonWidget(
                text: 'Áp dụng',
                onPress: () {},
                width: 100.0,
                textStyle: const TextStyle(color: MyColor.whiteClr),
                color: AppColors.blueClr,
                padding: EdgeInsets.zero),
          )
        ],
      ),
    );
  }
}
