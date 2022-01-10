import 'package:doan/widget/AppBar/my_app_bar_sec.dart';

import 'package:flutter/material.dart';
import '../EmailScreen/components/body.dart';

class EmailPageScreen extends StatefulWidget {
  const EmailPageScreen({Key? key}) : super(key: key);

  @override
  _EmailPageScreenState createState() => _EmailPageScreenState();
}

class _EmailPageScreenState extends State<EmailPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Email', null),
      body: Body(),
    );
  }
}
