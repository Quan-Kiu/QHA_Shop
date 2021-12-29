import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSize buildAppBar(context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Container(
      decoration: const BoxDecoration(
          color: AppColors.whiteClr,
          border: Border(
              bottom: BorderSide(color: AppColors.lightClr, width: 1.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: SizedBox(
                width: 280,
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm sản phẩm',
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white70,
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Colors.grey.shade100, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide:
                            BorderSide(color: Colors.grey.shade100, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RoutesName.PRODUCT_FAVORITE_PAGE);
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(AppAssetsPath.notificationIcon,
                      color: Colors.grey),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.NOTIFY_PAGE);
                  },
                )
              ]),
        ],
      ),
    ),
  );
}
