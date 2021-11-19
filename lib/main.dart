import "package:flutter/material.dart";
import 'package:doan/constants.dart';
import "package:doan/screens/loginScreen/login_screen.dart";

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
          scaffoldBackgroundColor: MyColor.whiteClr,
          textTheme: const TextTheme(
              bodyText2: TextStyle(
                  color: MyColor.grayClr,
                  letterSpacing: defaultSpacing,
                  fontSize: MyTextSize.normalText))),
      home: const LoginScreen(),
    );
  }
}
