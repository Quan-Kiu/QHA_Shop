// ignore_for_file: unused_import
import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/accountview.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: type.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            child: ListTile(
              onTap: () async {
                if (type[index].name == 'Đăng xuất') {
                  var res = await MyApi().getData('logout');
                  if (res['success'] != null && res['success']) {
                    AlertMessage.showMsg(context, res['message']);
                    Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                  } else {
                    AlertMessage.showMsg(
                        context, 'Có lỗi xảy ra, vui lòng thử lại sau.');
                  }
                } else {
                  Navigator.pushNamed(context, type[index].router);
                }
              },
              title: Text(
                type[index].name,
                style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.75),
              ),
              leading: IconButton(
                  icon: SvgPicture.asset(
                      AppAssetsPath.iconPath + type[index].icon,
                      color: AppColors.blueClr,
                      width: 20.0),
                  color: AppColors.grayClr,
                  onPressed: () {}),
            ),
          );
        });
    ;
  }
}
