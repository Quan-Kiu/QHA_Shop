import 'package:doan/config/routes/router.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/providers/auth.dart';
import 'package:doan/providers/notify.dart';
import 'package:doan/providers/order_status.dart';
import 'package:doan/providers/product_type.dart';
import 'package:doan/providers/products.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/providers/shippingInfo.dart';
import "package:flutter/material.dart";
import 'constants/themes/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Auth()),
      ChangeNotifierProvider(create: (_) => Products()),
      ChangeNotifierProvider(create: (_) => CartsProvider()),
      ChangeNotifierProvider(create: (_) => ShippingInfoProvider()),
      ChangeNotifierProvider(create: (_) => OrderStatusProvider()),
      ChangeNotifierProvider(create: (_) => ProductTypeProvider()),
      ChangeNotifierProvider(create: (_) => NotifyProvider())
    ],
    child: const MyApp(),
  ));
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
        initialRoute: RoutesName.FLASH_PAGE,
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
