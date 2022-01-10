import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/payment_card/component/body.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

class Paymentcard extends StatelessWidget {
  const Paymentcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildSecondaryAppBar(context, "Thẻ tín dụng hoặc thẻ ghi nợ", null),
      body: Body(),
      bottomNavigationBar: SizedBox(
        child: MyButtonWidget(
            text: 'Thêm',
            onPress: () => Navigator.pop(context),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0)),
      ),
    );
  }
}
