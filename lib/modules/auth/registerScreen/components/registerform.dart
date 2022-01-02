import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/validations.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _emailError = '';
  String _fullnameError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';
  bool _isLoading = false;

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  _register() async {
    var isError;
    try {
      isError = Validations.fullname(fullnameController.text, (error) {
        setState(() {
          _fullnameError = error;
        });
      });

      isError = Validations.email(emailController.text, (error) {
        setState(() {
          _emailError = error;
        });
      });

      isError = Validations.password(passwordController.text, (error) {
        setState(() {
          _passwordError = error;
        });
      });

      isError = Validations.confirmPassword(
          confirmPasswordController.text, passwordController.text, (error) {
        setState(() {
          _confirmPasswordError = error;
        });
      });
    } catch (e) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var formData = {
      'fullname': fullnameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text
    };

    var response = await MyApi().postData(formData, 'register');
    if (response['success']) {
      Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
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
    return _isLoading? const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: CircularProgressIndicator(),
          ): Form(
      child: Column(
        children: [
          MyTextFormField(
              textController: fullnameController,
              hintText: "Họ Tên",
              errorText: _fullnameError,
              prefixIcon: Icons.person_outline_outlined),
          MyTextFormField(
              textController: emailController,
              errorText: _emailError,
              hintText: "Email",
              prefixIcon: Icons.email_outlined),
          MyTextFormField(
              textController: passwordController,
              hintText: "Mật khẩu",
              errorText: _passwordError,
              obscureText: true,
              prefixIcon: Icons.lock_outline),
          MyTextFormField(
              textController: confirmPasswordController,
              errorText: _confirmPasswordError,
              hintText: "Nhập lại mật khẩu",
              obscureText: true,
              prefixIcon: Icons.lock_outline),
          MyButtonWidget(
            padding: const EdgeInsets.only(top: 47.0),
            text: "Đăng ký",
            textStyle: const TextStyle(
                color: AppColors.whiteClr, fontWeight: FontWeight.bold),
            onPress: () {
              _register();
            },
            color: AppColors.blueClr,
          ),
        ],
      ),
    );
  }
}
