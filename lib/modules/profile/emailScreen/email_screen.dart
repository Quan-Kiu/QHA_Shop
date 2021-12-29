import '../EmailScreen/components/appbar.dart';
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
      appBar: buildAppBarInfo(),
      body: Body(),
    );
  }
}
