import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/providers/notify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSize buildPrimaryAppBar(context, unreadCount) {
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
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.SEARCH_PAGE),
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm sản phẩm',
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white70,
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade100, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.blueClr, width: 1),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.NOTIFY_PAGE);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(AppAssetsPath.notificationIcon,
                            color: Colors.grey),
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.NOTIFY_PAGE);
                        },
                      ),
                      unreadCount != null && unreadCount != 0
                          ? Positioned(
                              left: 5,
                              top: 10,
                              child: Container(
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    unreadCount.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteClr),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: AppColors.redClr,
                                ),
                              ))
                          : const Text(''),
                    ],
                  ),
                )
              ]),
        ],
      ),
    ),
  );
}
