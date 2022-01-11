// ignore_for_file: unused_import
import 'package:doan/api/my_api.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/models/carts.dart';
import 'package:doan/models/product.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/providers/order_status.dart';
import 'package:doan/providers/products.dart';
import 'package:doan/providers/shippingInfo.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';
import 'package:provider/src/provider.dart';
import '../../widget/AppBar/my_app_bar_pri.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<Products>(context).getProducts();
    Provider.of<Products>(context).getDiscountProducts();
    Provider.of<ShippingInfoProvider>(context, listen: false).getShippingInfo();
    Provider.of<CartsProvider>(context, listen: false).getCart();
    Provider.of<OrderStatusProvider>(context, listen: false).getOrderStatus();
    return Scaffold(
      appBar: buildPrimaryAppBar(context),
      body: const Body(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
