import 'package:doan/components/myheaderauth_widget.dart';
import 'package:doan/constants.dart';
import 'package:flutter/material.dart';
import 'package:doan/components/mytext_widget.dart';
import 'package:doan/components/mytextformfield_widget.dart';
import 'package:doan/components/mybutton_widget.dart';
import 'package:doan/screens/myscreen.dart';

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
                      onPress: () {},
                      color: MyColor.blueClr,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyScreen.loginScreen));
                      },
                      child: const MyTextWidget(
                          text: "Quay lại",
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
