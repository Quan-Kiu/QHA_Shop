import 'package:doan/components/myheaderauth_widget.dart';
import 'package:doan/constants.dart';
import 'package:doan/screens/loginScreen/components/loginform.dart';
import 'package:flutter/material.dart';
import 'package:doan/components/mytext_widget.dart';
import 'package:doan/components/mybutton_widget.dart';
import 'package:doan/screens/myscreen.dart';
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
                  color: MyColor.whiteClr,
                  textColor: MyColor.grayClr,
                  icon: SvgPicture.asset(MyIcons.googleIcon)),
              MyButtonWidget(
                  padding: const EdgeInsets.only(top: 15.0),
                  text: "Đăng nhập bằng Facebook",
                  onPress: () {},
                  color: MyColor.whiteClr,
                  isSocial: true,
                  textColor: MyColor.grayClr,
                  icon: SvgPicture.asset(MyIcons.facebookIcon)),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyScreen.forgotPasswordScreen));
                  },
                  child: const MyTextWidget(
                      text: "Quên mật khẩu",
                      isBold: true,
                      color: MyColor.blueClr)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn không có tài khoản?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyScreen.registerScreen));
                      },
                      child: const MyTextWidget(
                          text: "Đăng ký",
                          isBold: true,
                          color: MyColor.blueClr)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
