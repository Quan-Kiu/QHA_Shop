import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/providers/carts.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'nav_item.dart';

var navItemLst = [
  {
    "icon": AppAssetsPath.homeIcon,
    "title": "Home",
    "router": RoutesName.HOME_PAGE
  },
  {
    "icon": AppAssetsPath.searchIcon,
    "title": 'Tìm kiếm',
    "router": RoutesName.SEARCH_PAGE
  },
  {
    "icon": AppAssetsPath.cartIcon,
    "title": 'Giỏ hàng',
    "router": RoutesName.CART_PAGE
  },
  {
    "icon": AppAssetsPath.offerIcon,
    "title": 'Deal',
    "router": RoutesName.DISCOUNT_PAGE
  },
  {
    "icon": AppAssetsPath.userIcon,
    "title": 'Tài khoản',
    "router": RoutesName.ACCOUNT_PAGE
  }
];

buildBottomNavBar(context, active) => Container(
      height: 75,
      width: double.infinity,
      decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.lightClr, width: 2.0))),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              navItemLst.length,
              (index) => NavItem(
                  icon: navItemLst[index]['icon'].toString(),
                  title: navItemLst[index]['title'].toString(),
                  active: navItemLst[index]['title'] == active,
                  router: navItemLst[index]['router'].toString()))),
    );
