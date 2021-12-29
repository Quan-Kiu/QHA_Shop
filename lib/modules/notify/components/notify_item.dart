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
    Widget media = notify.media != ''
        ? Image.network(
            notify.media,
            width: 60.0,
          )
        : SvgPicture.asset(AppAssetsPath.TransactionIcon);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
                Text(
                  notify.createdAt.toString(),
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
