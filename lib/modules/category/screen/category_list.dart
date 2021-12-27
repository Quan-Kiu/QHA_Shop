import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/modules/category/components/appbar.dart';
import 'package:doan/modules/category/components/body.dart';
import 'package:doan/modules/category/components/navbar.dart';
import 'package:doan/modules/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const Category_List());
}

class Category_List extends StatelessWidget {
  const Category_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: buildAppBar(),
        body: body(),
        bottomNavigationBar: Container(
          height: 75,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavBar(
                icon: AppAssetsPath.homeIcon,
                title: 'Home',
              ),
              const NavBar(
                icon: AppAssetsPath.searchIcon,
                title: 'Tìm kiếm',
              ),
              const NavBar(
                icon: AppAssetsPath.cartIcon,
                title: 'Giỏ hàng',
              ),
              const NavBar(
                icon: AppAssetsPath.offerIcon,
                title: 'Deal',
              ),
              const NavBar(
                icon: AppAssetsPath.userIcon,
                title: 'Tài khoản',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
