import 'package:doan/modules/checkout/component/bodyCheckout.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutPage());
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Thanh toán"),
      body: bodyCheckoutPage(),
    );
  }
}
