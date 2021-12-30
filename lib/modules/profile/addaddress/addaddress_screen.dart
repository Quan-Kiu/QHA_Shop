import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import 'compoments/body.dart';

class AddAddressPageScreen extends StatefulWidget {
  const AddAddressPageScreen({Key? key}) : super(key: key);

  @override
  _AddAddressPageScreenState createState() => _AddAddressPageScreenState();
}

class _AddAddressPageScreenState extends State<AddAddressPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thêm địa chỉ'),
      body: Body(),
    );
  }
}
