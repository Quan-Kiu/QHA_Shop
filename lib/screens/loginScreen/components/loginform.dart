import 'package:doan/components/mybutton_widget.dart';
import 'package:doan/components/mytextformfield_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const MyTextFormField(
              hintText: "Your Email", prefixIcon: Icons.email_outlined),
          const MyTextFormField(
              hintText: "Your Password",
              obscureText: true,
              prefixIcon: Icons.lock_outline),
          MyButtonWidget(
            padding: const EdgeInsets.only(top: 47.0),
            text: "Đăng nhập",
            onPress: () {},
            color: MyColor.blueClr,
          ),
        ],
      ),
    );
  }
}
