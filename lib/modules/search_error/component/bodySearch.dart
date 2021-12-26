import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodySearch extends StatelessWidget {
  const BodySearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 18.0, top: 20.0),
                child: Text(
                  "0 Kết quả",
                  style: TextStyle(
                      color: MyColor.grayClr,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          AlertModal(      
            title: 'Sản phẩm không tồn tại',
            subtitle: 'Cảm ơn bạn đã sử dụng sản phẩm của chúng tôi',
            icon: AppAssetsPath.cancleIcon,
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

