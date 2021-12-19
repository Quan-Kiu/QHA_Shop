import '../changePasswordScreen/components/appbar.dart';
import 'package:flutter/material.dart';
import '../changePasswordScreen/components/body.dart';

class ChangePasswordPageScreen extends StatefulWidget {
  const ChangePasswordPageScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageScreenState createState() => _ChangePasswordPageScreenState();
}

class _ChangePasswordPageScreenState extends State<ChangePasswordPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInfo(),
      body: Body(),
    );
  }
}