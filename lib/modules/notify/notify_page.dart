import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/modules/notify/components/cate_notify_item.dart';
import 'package:doan/providers/notify.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unreadCount = context.watch<NotifyProvider>().unReadCount;
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thông báo', null),
      body: SizedBox(
        child: Column(
          children: [
            Cate_Notify_Item(
              label: 'Bài viết',
              icon: AppAssetsPath.listIcon,
              router: RoutesName.POSTS_NOTIFY_PAGE,
            ),
            Cate_Notify_Item(
                label: 'Hoạt động',
                icon: AppAssetsPath.notificationIcon,
                notifyCount: unreadCount,
                router: RoutesName.ACTIVITIES_NOTIFY_PAGE),
          ],
        ),
      ),
    );
  }
}
