import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/modules/notify/components/cate_notify_item.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Thông báo'),
      body: SizedBox(
        child: Column(
          children: const [
            Cate_Notify_Item(
              label: 'Bài viết',
              icon: AppAssetsPath.listIcon,
              router: RoutesName.POSTS_NOTIFY_PAGE,
            ),
            Cate_Notify_Item(
                label: 'Hoạt động',
                icon: AppAssetsPath.notificationIcon,
                notifyCount: 2,
                router: RoutesName.ACTIVITIES_NOTIFY_PAGE),
          ],
        ),
      ),
    );
  }
}
