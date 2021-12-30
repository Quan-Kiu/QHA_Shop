import 'package:doan/modules/list_category/component/bodyListCate.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const List_Category());
}

class List_Category extends StatelessWidget {
  const List_Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Danh mục'),
      body: Body(),
    );
  }
}
