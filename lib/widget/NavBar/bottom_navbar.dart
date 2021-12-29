import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'nav_item.dart';

buildBottomNavBar() => Container(
      height: 75,
      width: double.infinity,
      decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.lightClr, width: 2.0))),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          NavItem(
              icon: AppAssetsPath.homeIcon,
              title: 'Home',
              active: true,
              router: RoutesName.HOME_PAGE),
          NavItem(
              icon: AppAssetsPath.searchIcon,
              title: 'Tìm kiếm',
              router: RoutesName.SEARCH_PAGE),
          NavItem(
              icon: AppAssetsPath.cartIcon,
              title: 'Giỏ hàng',
              router: RoutesName.CART_PAGE),
          NavItem(
              icon: AppAssetsPath.offerIcon,
              title: 'Deal',
              router: RoutesName.LIST_PRODUCT_PAGE),
          NavItem(
              icon: AppAssetsPath.userIcon,
              title: 'Tài khoản',
              router: RoutesName.INFO_PAGE),
        ],
      ),
    );
