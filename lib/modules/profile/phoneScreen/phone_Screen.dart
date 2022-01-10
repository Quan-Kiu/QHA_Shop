import 'package:doan/widget/AppBar/my_app_bar_sec.dart';

import 'package:flutter/material.dart';
import '../PhoneScreen/components/body.dart';

class PhonePageScreen extends StatefulWidget {
  const PhonePageScreen({Key? key}) : super(key: key);

  @override
  _PhonePageScreenState createState() => _PhonePageScreenState();
}

class _PhonePageScreenState extends State<PhonePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Số điện thoại', null),
      body: Body(),
    );
  }
}
