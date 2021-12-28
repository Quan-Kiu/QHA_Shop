// ignore_for_file: unused_import
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';

import './components/appbar.dart';
import './components/body.dart';
import 'package:flutter/material.dart';
import 'package:doan/modules/category/components/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
