import 'package:doan/widget/AppBar/my_app_bar_sec.dart';

import 'package:flutter/material.dart';
import 'components/body.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Chỉnh sửa hồ sơ', null),
      body: Body(),
    );
  }
}
