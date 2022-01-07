import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/models/user.dart';
import 'package:doan/providers/auth.dart';
import "package:flutter/material.dart";
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './components/body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _refeshToken() async {
    var response = await MyApi().getData('refreshtoken');
    if (response['success'] != null && response['success']) {
      var user = User.fromJson(response['data']['user']);
      var token = response['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('qhatoken', token);
      context.read<Auth>().update({'user': user, 'token': token});
      Navigator.pushNamed(context, RoutesName.HOME_PAGE);
    }
  }

  @override
  void initState() {
    super.initState();
    _refeshToken();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
