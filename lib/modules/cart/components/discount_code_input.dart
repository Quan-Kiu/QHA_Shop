import 'package:doan/api/my_api.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/discount.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';

class DiscountCodeInput extends StatelessWidget {
  final String discount;
  DiscountCodeInput({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController discountController =
        TextEditingController(text: discount);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Stack(
        children: [
          SizedBox(
            height: 57,
            child: TextFormField(
                style: AppTextStyles.mediumTextBold,
                controller: discountController,
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
                onPress: () async {
                  var formData = {
                    "code": discountController.text.toUpperCase()
                  };
                  Map<String, dynamic> res = await MyApi()
                      .postData(formData, 'discount/checkDiscount');
                  if (res['success'] != null && res['success']) {
                    var discount = Discount.fromJson(res['data']);
                    context.read<CartsProvider>().setDiscount(discount);
                    AlertMessage.showMsg(
                        context, 'Áp dụng mã giảm giá thành công.');
                  } else {
                    AlertMessage.showMsg(context, res['message']);
                  }
                },
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
