import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/myheaderauth_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
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
                  title: "Cùng bắt đầu", subTitle: "Quên mật khẩu tài khoản"),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    const MyTextFormField(
                        hintText: "Your Email",
                        prefixIcon: Icons.email_outlined),
                    MyButtonWidget(
                      padding: const EdgeInsets.only(top: 47.0),
                      text: "Quên mật khẩu",
                      textStyle: const TextStyle(
                          color: AppColors.whiteClr,
                          fontWeight: FontWeight.bold),
                      onPress: () {},
                      color: AppColors.blueClr,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Quay lại trang đăng nhập?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const MyTextWidget(
                          text: "Quay lại",
                          isBold: true,
                          color: AppColors.blueClr)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
