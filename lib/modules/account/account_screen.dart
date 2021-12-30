import 'package:doan/widget/NavBar/bottom_navbar.dart';

import 'components/appbar.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class AccountPageScreen extends StatefulWidget {
  const AccountPageScreen({Key? key}) : super(key: key);

  @override
  _AccountPageScreenState createState() => _AccountPageScreenState();
}

class _AccountPageScreenState extends State<AccountPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInfo(),
      body: Body(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}


