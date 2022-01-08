import 'package:doan/models/transpost.dart';
import 'package:doan/providers/shippingInfo.dart';
import 'package:doan/widget/transpost_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class bodyTranspost extends StatelessWidget {
  const bodyTranspost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> shippingInfos =
        context.watch<ShippingInfoProvider>().myShippingInfo;
    return ListView.builder(
        itemCount: itemTrans.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [TransPost_Card(shippingInfo: shippingInfos[index])],
          );
        });
  }
}
