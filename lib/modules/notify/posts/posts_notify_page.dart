import 'package:doan/models/notify.dart';
import 'package:doan/modules/notify/components/notify_item.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

class Posts_Notify_Page extends StatelessWidget {
  const Posts_Notify_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Bài viết', null),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Notify_Item(
                notify: postNotifyItem,
              ),
              Notify_Item(
                notify: postNotifyItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
