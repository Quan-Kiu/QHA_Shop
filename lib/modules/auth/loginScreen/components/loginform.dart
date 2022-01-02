import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/user.dart';
import 'package:doan/providers/auth.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/validations.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _emailError = '';
  String _passwordError = '';
  bool _isLoading = false;

  _login() async {
    var isError;
    try {
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
    } catch (e) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var formData = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    var response = await MyApi().postData(formData, 'login');

    if (response['success']) {
      var user = new User.fromJson(response['data']['user']);
      context
          .read<Auth>()
          .update({'user': user, 'token': response['data']['token']});
      Navigator.pushNamed(context, RoutesName.HOME_PAGE);
    } else {
      AlertMessage.showMsg(context, response['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: CircularProgressIndicator(),
          )
        : Form(
            child: Column(
              children: [
                MyTextFormField(
                    hintText: "Your Email",
                    prefixIcon: Icons.email_outlined,
                    errorText: _emailError,
                    textController: emailController),
                MyTextFormField(
                  hintText: "Your Password",
                  obscureText: true,
                  errorText: _passwordError,
                  prefixIcon: Icons.lock_outline,
                  textController: passwordController,
                ),
                MyButtonWidget(
                  padding: const EdgeInsets.only(top: 47.0),
                  text: "Đăng nhập",
                  textStyle: const TextStyle(
                      color: AppColors.whiteClr,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  onPress: () {
                    _login();
                  },
                  color: AppColors.blueClr,
                ),
              ],
            ),
          );
  }
}
