import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class Cate_Notify_Item extends StatelessWidget {
  final String label;
  final String icon;
  final String router;
  final notifyCount;

  const Cate_Notify_Item(
      {Key? key,
      required this.label,
      required this.icon,
      this.notifyCount = 0,
      required this.router})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget NotifyCountWidget = notifyCount > 0
        ? Container(
            width: 20,
            height: 20,
            child: Center(
              child: Text(
                notifyCount.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.whiteClr),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: AppColors.redClr,
            ),
          )
        : const Text('');
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, router),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.mediumTextBold,
              ),
            ),
            NotifyCountWidget,
          ],
        ),
      ),
    );
  }
}
