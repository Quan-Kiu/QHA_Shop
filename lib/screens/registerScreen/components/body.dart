import 'package:doan/components/myheaderauth_widget.dart';
import 'package:doan/constants.dart';
import 'package:doan/screens/MyScreen.dart';
import 'package:doan/screens/registerScreen/components/registerform.dart';
import 'package:flutter/material.dart';
import 'package:doan/components/mytext_widget.dart';

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyScreen.loginScreen));
                      },
                      child: const MyTextWidget(
                          text: "Đăng nhập",
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
