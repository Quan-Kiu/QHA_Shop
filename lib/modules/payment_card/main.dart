import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/payment_card/component/body.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Paymentcard());
}

class Paymentcard extends StatelessWidget {
  const Paymentcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Chọn thẻ"),
      body: body(),
      bottomNavigationBar: Container(
        child: MyButtonWidget(
            text: 'Thanh toán',
            onPress: () => Navigator.pop(context),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0)),
      ),
    );
  }
}
