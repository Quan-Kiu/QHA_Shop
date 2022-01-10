import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import 'compoments/body.dart';

class AddCardPageScreen extends StatefulWidget {
  const AddCardPageScreen({Key? key}) : super(key: key);

  @override
  _AddCardPageScreenState createState() => _AddCardPageScreenState();
}

class _AddCardPageScreenState extends State<AddCardPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Địa chỉ', null),
      body: Body(),
    );
  }
}
