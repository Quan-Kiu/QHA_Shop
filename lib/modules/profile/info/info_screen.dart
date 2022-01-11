import 'package:doan/widget/AppBar/my_app_bar_pri.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class InfoPageScreen extends StatefulWidget {
  const InfoPageScreen({Key? key}) : super(key: key);

  @override
  _InfoPageScreenState createState() => _InfoPageScreenState();
}

class _InfoPageScreenState extends State<InfoPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thông tin cá nhân', null),
      body: Body(),
    );
  }
}
