import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/category/components/appbar.dart';
import 'package:doan/modules/category/components/body.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';
import 'package:doan/widget/NavBar/navbar_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Category_List());
}

class Category_List extends StatelessWidget {
  const Category_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: body(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
