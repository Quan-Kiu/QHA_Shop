import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class Product_Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Sản phẩm yêu thích', null),
      body: Body(),
    );
  }
}
