import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

class bodyCheckoutComplete extends StatelessWidget {
  const bodyCheckoutComplete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AlertModal(
            title: 'Thành công',
            subtitle: 'Cảm ơn bạn đã sử dụng dịch vụ',
            icon: AppAssetsPath.completeIcon,
            mycolor: AppColors.blueClr,
          ),
          MyButtonWidget(
              text: "Quay trở về trang chủ",
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              onPress: () {
                Navigator.pushNamed(context, RoutesName.HOME_PAGE);
              },
              color: AppColors.blueClr,
              padding: EdgeInsets.all(8.0))
        ],
      ),
    );
  }
}
