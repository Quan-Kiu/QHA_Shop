// ignore_for_file: unused_import
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';

import '../../widget/AppBar/my_app_bar_pri.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrimaryAppBar(context),
      body: Body(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
