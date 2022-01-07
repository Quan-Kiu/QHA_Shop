// ignore_for_file: unused_import
import 'package:doan/api/my_api.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/validations.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/button_widget.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FocusNode myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordconfirmationController =
      TextEditingController();
  String _currentPasswordError = '';
  String _passwordError = '';
  String _passwordconfirmationError = '';
  bool _isLoading = false;

  _changePassword() async {
    var isError;
    try {
      isError = Validations.password(currentPasswordController.text, (error) {
        setState(() {
          _currentPasswordError = error;
        });
      });

      isError = Validations.password(passwordController.text, (error) {
        setState(() {
          _passwordError = error;
        });
      });

      isError = Validations.confirmPassword(
          passwordconfirmationController.text, passwordController.text,
          (error) {
        setState(() {
          _passwordconfirmationError = error;
        });
      });
    } catch (e) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var formData = {
      'current_password': currentPasswordController.text,
      'password': passwordController.text,
      'password_confirmation': passwordconfirmationController.text
    };

    var response = await MyApi().putData(formData, 'user/changePassword');

    print(response);

    if (response['success'] != null && response['success']) {
      AlertMessage.showMsg(context, response['message']);
    } else {
      AlertMessage.showMsg(context, response['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Mật khẩu cũ",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          MyTextFormField(
            hintText: "Mật khẩu cũ",
            obscureText: true,
            errorText: _currentPasswordError,
            prefixIcon: Icons.lock_outline,
            textController: currentPasswordController,
          ),

          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Mật khẩu mới",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),

          MyTextFormField(
            hintText: "Mật khẩu cũ",
            obscureText: true,
            errorText: _passwordError,
            prefixIcon: Icons.lock_outline,
            textController: passwordController,
          ),

          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Nhập lại mật khẩu mới",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),

          MyTextFormField(
            hintText: "Nhập lại mật khẩu mới",
            obscureText: true,
            errorText: _passwordconfirmationError,
            prefixIcon: Icons.lock_outline,
            textController: passwordconfirmationController,
          ),

          //buidlSubmit(),
          MyButtonWidget(
            padding: const EdgeInsets.only(top: 100.0),
            text: "Lưu",
            textStyle: const TextStyle(
                color: AppColors.whiteClr, fontWeight: FontWeight.bold),
            onPress: () {
              _changePassword();
            },
            color: AppColors.blueClr,
          ),
        ],
      )),
    );
  }
}
