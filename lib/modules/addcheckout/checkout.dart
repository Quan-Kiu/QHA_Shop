import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/addcheckout/component/bodyAddCheckout.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AddCheckout());
}

class AddCheckout extends StatelessWidget {
  const AddCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Thanh toán'),
      body: bodyaddcheckout(),
      bottomNavigationBar: Container(
        child: MyButtonWidget(
            text: 'Thêm Thanh Toán',
            onPress: () => Navigator.pop(context),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0)),
      ),
    );
  }
}
