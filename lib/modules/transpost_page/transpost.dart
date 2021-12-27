import 'package:doan/modules/transpost_page/component/bodyTransPost.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TransPost());
}

class TransPost extends StatelessWidget {
  const TransPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Vận chuyển đến'),
      body: bodyTransPost(),
    );
  }
}
