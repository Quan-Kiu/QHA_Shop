import 'package:doan/modules/checkout_complete/component/Body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Checkout_Complete());
}

class Checkout_Complete extends StatelessWidget {
  const Checkout_Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyCheckoutComplete(),
    );
  }
}


