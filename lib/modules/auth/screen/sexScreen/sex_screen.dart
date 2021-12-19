import '../sexScreen/components/appbar.dart';
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
      appBar: buildAppBarInfo(),
      body: Body(),
    );
  }
}


