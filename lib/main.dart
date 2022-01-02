import 'package:doan/config/routes/router.dart';
import 'package:doan/config/routes/routes_name.dart';
import "package:flutter/material.dart";
import 'constants/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "QHAShop",
        theme: theme(),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RoutesName.LOGIN_PAGE,
      ),
    );
  }
}

ThemeData theme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
          color: AppColors.whiteClr,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.darkClr),
          titleTextStyle: TextStyle(
              fontSize: 16,
              color: AppColors.darkClr,
              fontWeight: FontWeight.bold)),
      fontFamily: "Poppins",
      scaffoldBackgroundColor: AppColors.whiteClr,
      textTheme: const TextTheme(
          bodyText2: TextStyle(color: AppColors.grayClr, fontSize: 14)));
}
