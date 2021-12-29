import '../dateofbirthScreen/components/appbar.dart';
import 'package:flutter/material.dart';
import '../dateofbirthScreen/components/body.dart';

class DateOBPageScreen extends StatefulWidget {
  const DateOBPageScreen({Key? key}) : super(key: key);

  @override
  _DateOBPageScreenState createState() => _DateOBPageScreenState();
}

class _DateOBPageScreenState extends State<DateOBPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInfo(),
      body: Body(),
    );
  }
}


