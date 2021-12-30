import 'package:doan/modules/category/components/body.dart';
import 'package:doan/widget/AppBar/my_app_bar_pri.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Category_List());
}

class Category_List extends StatelessWidget {
  const Category_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildPrimaryAppBar(context),
        body: Body(),
        bottomNavigationBar: buildBottomNavBar());
  }
}
