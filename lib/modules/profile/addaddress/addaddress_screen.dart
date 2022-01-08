import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import 'compoments/body.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thêm địa chỉ'),
      body: const Body(),
    );
  }
}
