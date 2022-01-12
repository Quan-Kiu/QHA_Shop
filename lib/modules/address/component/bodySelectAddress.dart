import 'package:doan/models/address.dart';
import 'package:doan/models/shipping_info.dart';
import 'package:doan/providers/shippingInfo.dart';
import 'package:doan/widget/transpost_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

// ignore: camel_case_types
class bodySelectAddress extends StatelessWidget {
  const bodySelectAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> shippingInfos =
        context.watch<ShippingInfoProvider>().myShippingInfo;
    return ListView.builder(
        itemCount: shippingInfos.length,
        itemBuilder: (BuildContext context, int index) {
          return TransPost_Card(
            shippingInfo: shippingInfos[index],
            isPayment: true,
          );
        });
  }
}
