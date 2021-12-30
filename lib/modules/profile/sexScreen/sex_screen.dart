import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import '../sexScreen/components/body.dart';

class SexPageScreen extends StatefulWidget {
  const SexPageScreen({Key? key}) : super(key: key);

  @override
  _SexPageScreenState createState() => _SexPageScreenState();
}

class _SexPageScreenState extends State<SexPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Giới tính'),
      body: Body(),
    );
  }
}
