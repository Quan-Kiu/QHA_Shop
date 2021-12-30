import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/transpost.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/transpost_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bodyRemove extends StatelessWidget {
  const bodyRemove({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 175),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                  width: 152,
                  height: 130,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssetsPath.WarringIcon,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text(
                  "Confirmation",
                  style: TextStyle(
                      color: AppColors.darkClr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text(
                  "Bạn có chắc chắn muốn xóa địa chỉ không",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.grayClr,
                      fontSize: 15,
                      letterSpacing: 1.5),
                ),
              ),
              Container(
                child: MyButtonWidget(
                    text: 'Xoá',
                    onPress: () => Navigator.pop(context),
                    color: AppColors.blueClr,
                    textStyle: const TextStyle(
                        color: AppColors.whiteClr, fontSize: 16.0),
                    padding: const EdgeInsets.all(10.0)),
              ),
              Container(
                child: MyButtonWidget(
                  text: 'Trở về',
                  onPress: () => Navigator.pop(context),
                  color: AppColors.whiteClr,
                  textStyle:
                      const TextStyle(color: AppColors.grayClr, fontSize: 16.0),
                  padding: const EdgeInsets.all(10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
