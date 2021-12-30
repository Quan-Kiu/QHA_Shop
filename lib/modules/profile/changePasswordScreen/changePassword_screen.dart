import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import '../changePasswordScreen/components/body.dart';

class ChangePasswordPageScreen extends StatefulWidget {
  const ChangePasswordPageScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageScreenState createState() =>
      _ChangePasswordPageScreenState();
}

class _ChangePasswordPageScreenState extends State<ChangePasswordPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thay đổi mật khẩu'),
      body: Body(),
    );
  }
}
