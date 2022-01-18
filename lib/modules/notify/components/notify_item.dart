import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/notify.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class Notify_Item extends StatelessWidget {
  final Notify notify;
  const Notify_Item({
    Key? key,
    required this.notify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget media = SvgPicture.asset(AppAssetsPath.TransactionIcon);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      color: notify.isRead == 1 ? AppColors.whiteClr : AppColors.lightClr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          media,
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                  text: notify.title,
                  isBold: true,
                  color: AppColors.darkClr,
                  fontSize: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    notify.description,
                    style: const TextStyle(fontSize: 14.0, height: 1.5),
                  ),
                ),
                Text(
                  notify.createdAt.replaceFirst('T', ' ').substring(0, 16),
                  style: const TextStyle(color: AppColors.darkClr),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
