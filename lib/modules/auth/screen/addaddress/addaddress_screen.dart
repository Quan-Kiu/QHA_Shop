import 'compoments/appbar.dart';
import 'package:flutter/material.dart';
import 'compoments/body.dart';

class AddAddressPageScreen extends StatefulWidget {
  const AddAddressPageScreen({Key? key}) : super(key: key);

  @override
  _AddAddressPageScreenState createState() => _AddAddressPageScreenState();
}

class _AddAddressPageScreenState extends State<AddAddressPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInfo(),
      body: Body(),
    );
  }
}