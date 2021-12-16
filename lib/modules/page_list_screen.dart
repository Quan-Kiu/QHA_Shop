import 'package:doan/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageList extends StatelessWidget {
  PageList({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  List<String> RouteList = [
    RoutesName.LOGIN_PAGE,
    RoutesName.REGISTER_PAGE,
    RoutesName.FORGOT_PASS_PAGE,
    RoutesName.HOME_PAGE,
    RoutesName.PRODUCT_DETAIL_PAGE,
    RoutesName.LIST_PRODUCT_PAGE,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 50),
      itemBuilder: (BuildContext context, int index) => TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteList[index]);
        },
        child: Text(
          RouteList[index],
          style: const TextStyle(fontSize: 20),
        ),
      ),
      itemCount: RouteList.length,
    );
  }
}
