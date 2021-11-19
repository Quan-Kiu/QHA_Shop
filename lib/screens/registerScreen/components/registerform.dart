import 'package:doan/components/mybutton_widget.dart';
import 'package:doan/components/mytextformfield_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const MyTextFormField(
              hintText: "Họ Tên", prefixIcon: Icons.person_outline_outlined),
          const MyTextFormField(
              hintText: "Email", prefixIcon: Icons.email_outlined),
          const MyTextFormField(
              hintText: "Mật khẩu",
              obscureText: true,
              prefixIcon: Icons.lock_outline),
          const MyTextFormField(
              hintText: "Nhập lại mật khẩu",
              obscureText: true,
              prefixIcon: Icons.lock_outline),
          MyButtonWidget(
            padding: const EdgeInsets.only(top: 47.0),
            text: "Đăng ký",
            onPress: () {},
            color: MyColor.blueClr,
          ),
        ],
      ),
    );
  }
}
