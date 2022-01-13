import 'package:doan/models/notify.dart';
import 'package:doan/modules/notify/components/notify_item.dart';
import 'package:doan/providers/notify.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Activities_Notify_Page extends StatelessWidget {
  const Activities_Notify_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var notifies = context.watch<NotifyProvider>().get;
    Provider.of<NotifyProvider>(context).updateIsRead();
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Hoạt động', null),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
              children: List.generate(
            notifies.length,
            (index) => Notify_Item(
              notify: notifies[index],
            ),
          )),
        ),
      ),
    );
  }
}
