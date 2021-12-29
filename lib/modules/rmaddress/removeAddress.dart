import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/rmaddress/component/bodyRemove.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RemoveAddress());
}

class RemoveAddress extends StatelessWidget {
  const RemoveAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyRemove(),
    );
  }
}
