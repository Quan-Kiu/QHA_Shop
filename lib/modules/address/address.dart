import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

import 'component/bodyAddress.dart';

void main() {
  runApp(const Address());
}

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Địa chỉ'),
      body: bodyAddress(),
      bottomNavigationBar: Container(
        child: MyButtonWidget(
            text: 'Thêm đia chỉ',
            onPress: () => Navigator.pop(context),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0)),
      ),
    );
  }
}
