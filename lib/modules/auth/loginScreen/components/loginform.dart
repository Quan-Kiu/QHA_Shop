import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.all(20),
            text: "Đăng nhập",
            textStyle: const TextStyle(
                color: AppColors.whiteClr,
                fontSize: 14,
                fontWeight: FontWeight.bold),
            onPress: () {
              Navigator.pushNamed(context, RoutesName.HOME_PAGE);
            },
            color: AppColors.blueClr,
          ),
        ],
      ),
    );
  }
}
