import 'package:doan/modules/rmaddress/component/bodyRemove.dart';
import 'package:flutter/material.dart';

class RemoveAddress extends StatelessWidget {
  const RemoveAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyRemove(),
    );
  }
}
