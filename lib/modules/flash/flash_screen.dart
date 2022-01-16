import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/user.dart';
import 'package:doan/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _refeshToken() async {
      Map<String, dynamic> response = await MyApi().getData('refreshtoken');
      if (response['success'] != null && response['success']) {
        var user = User.fromJson(response['data']['user']);
        var token = response['data']['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('qhatoken', token);
        context.read<Auth>().update({'user': user, 'token': token});
        Navigator.pushNamed(context, RoutesName.HOME_PAGE);
      } else {
        Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
      }
    }

    _refeshToken();
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.blueClr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssetsPath.logoIcon),
            const SizedBox(
              height: 50.0,
            ),
            const CircularProgressIndicator(
              color: AppColors.lightClr,
            ),
          ],
        ));
  }
}
