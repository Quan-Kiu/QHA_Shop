import 'package:doan/models/shipping_info.dart';
import 'package:doan/modules/product_detail/components/product_main_infos.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

import 'compoment/body.dart';

class UpdateAddressPage extends StatelessWidget {
  final shippingInfo;
  const UpdateAddressPage({Key? key, required this.shippingInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thay đổi địa chỉ'),
      body: Body(shippinginfo: shippingInfo,),
    );
  }
}
