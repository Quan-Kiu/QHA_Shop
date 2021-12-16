import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/buttoncate.dart';
import 'package:doan/widget/mybutton_cate_widget.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

List<ButtonCate> buttonCate = [
  ButtonCate("Áo thun nam", AppAssetsPath.shirtIcon, "none"),
  ButtonCate("Đầm", AppAssetsPath.skirtIcon, "none"),
  ButtonCate("Túi xách nam", AppAssetsPath.manbagIcon, "none"),
  ButtonCate("Túi xách nữ", AppAssetsPath.womanbagIcon, "none"),
  ButtonCate("Giày Nam", AppAssetsPath.manshoesIcon, "none"),
  ButtonCate("Giày nữ", AppAssetsPath.womanshoesIcon, "none"),
];

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text('Danh Mục',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blue.shade900))
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
              height: 330,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: buttonCate.length,
                  itemBuilder: (BuildContext context, index) {
                    return MyButtonCategory(buttonCate: buttonCate[index]);
                  })),
          MyButtonWidget(
              text: 'Lưu',
              onPress: () {},
              color: AppColors.blueClr,
              padding: EdgeInsets.all(15),
              textStyle: TextStyle(
                  color: AppColors.whiteClr, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
