import 'package:doan/widget/AppBar/my_app_bar_sec.dart';

import 'package:flutter/material.dart';
import 'components/body.dart';

class RenamePageScreen extends StatefulWidget {
  const RenamePageScreen({Key? key}) : super(key: key);

  @override
  _RenamePageScreenState createState() => _RenamePageScreenState();
}

class _RenamePageScreenState extends State<RenamePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Họ tên', null),
      body: Body(),
    );
  }
}
