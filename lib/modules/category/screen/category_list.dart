import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/category/components/appbar.dart';
import 'package:doan/modules/category/components/body.dart';
import 'package:doan/modules/category/components/navbar.dart';
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
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: AppColors.lightClr, width: 2.0))),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            NavBar(
                icon: AppAssetsPath.homeIcon,
                title: 'Home',
                active: true,
                router: RoutesName.HOME_PAGE),
            NavBar(
                icon: AppAssetsPath.searchIcon,
                title: 'Tìm kiếm',
                router: RoutesName.SEARCH_RESULT),
            NavBar(
                icon: AppAssetsPath.cartIcon,
                title: 'Giỏ hàng',
                router: RoutesName.CART_PAGE),
            NavBar(
                icon: AppAssetsPath.offerIcon,
                title: 'Deal',
                router: RoutesName.LIST_PRODUCT_PAGE),
            NavBar(
                icon: AppAssetsPath.userIcon,
                title: 'Tài khoản',
                router: RoutesName.INFO_PAGE),
          ],
        ),
      ),
    );
  }
}
