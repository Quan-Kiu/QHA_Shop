import 'package:doan/modules/checkout/component/bodyCheckout.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutPage());
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, "Thanh toán"),
      body: bodyCheckoutPage(),
    );
  }
}
