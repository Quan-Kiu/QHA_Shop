import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/address/component/bodySelectAddress.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

import 'component/bodyAddress.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Chọn địa chỉ giao hàng', null),
      body: const bodySelectAddress(),
      // ignore: avoid_unnecessary_containers
      bottomNavigationBar: Container(
        child: MyButtonWidget(
            text: 'Thêm đia chỉ',
            onPress: () {
              Navigator.pushNamed(context, RoutesName.ADD_ADDRESS_PAGE);
            },
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0)),
      ),
    );
  }
}
