import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/myheaderauth_widget.dart';
import './loginform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderAuth(
                  title: "Chào bạn đến với QHA",
                  subTitle: "Đăng nhập để tiếp tục"),
              const SizedBox(
                height: 10,
              ),
              const LoginForm(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  "hoặc".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MyButtonWidget(
                  padding: const EdgeInsets.only(top: 15.0),
                  text: "Đăng nhập bằng Google",
                  onPress: () {},
                  isSocial: true,
                  color: AppColors.whiteClr,
                  textStyle: AppTextStyles.normalTextBold,
                  icon: SvgPicture.asset(AppAssetsPath.googleIcon)),
              MyButtonWidget(
                  padding: const EdgeInsets.only(top: 15.0),
                  text: "Đăng nhập bằng Facebook",
                  onPress: () {},
                  color: AppColors.whiteClr,
                  isSocial: true,
                  textStyle: AppTextStyles.normalTextBold,
                  icon: SvgPicture.asset(AppAssetsPath.facebookIcon)),
              const SizedBox(
                height: 60,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.FORGOT_PASS_PAGE);
                  },
                  child: const Text("Quên mật khẩu",
                      style: AppTextStyles.largeLinkText)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn không có tài khoản?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.REGISTER_PAGE);
                      },
                      child: const Text(
                        "Đăng ký",
                        style: AppTextStyles.largeLinkText,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
