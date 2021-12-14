import 'package:doan/config/routes/router.dart';
import 'package:doan/config/routes/routes_name.dart';
import "package:flutter/material.dart";
import 'package:doan/constants/assets/app_assets_path.dart';

import 'constants/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QHAShop",
      theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: AppColors.whiteClr,
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: AppColors.grayClr, fontSize: 12))),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.PAGE_LIST,
    );
  }
}
