import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/widget/myheaderauth_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import './registerform.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const MyHeaderAuth(
                  title: "Cùng bắt đầu", subTitle: "Tạo một tài khoản mới"),
              const SizedBox(
                height: 10,
              ),
              const RegisterForm(),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn có một tài khoản ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                      },
                      child: const Text("Đăng nhập",
                          style: AppTextStyles.largeLinkText))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
