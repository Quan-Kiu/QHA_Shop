import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
// ignore: unused_import
import 'package:doan/widget/NavBar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class AccountPageScreen extends StatefulWidget {
  const AccountPageScreen({Key? key}) : super(key: key);

  @override
  _AccountPageScreenState createState() => _AccountPageScreenState();
}

class _AccountPageScreenState extends State<AccountPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Tài khoản', RoutesName.HOME_PAGE),
      body: const Body(),
    );
  }
}
