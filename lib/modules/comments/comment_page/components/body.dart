import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/comment_item_widget.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      height: 45.0,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            6,
                            (index) => GestureDetector(
                              onTap: () => {},
                              child: Container(
                                margin: const EdgeInsets.only(right: 15.0),
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? AppColors.lightClr
                                        : AppColors.whiteClr,
                                    border:
                                        Border.all(color: AppColors.lightClr)),
                                constraints:
                                    const BoxConstraints(minWidth: 70.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    index == 0
                                        ? const Text('')
                                        : SvgPicture.asset(
                                            AppAssetsPath.starIcon,
                                            color: AppColors.yellowClr,
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: index == 0
                                          ? Text(
                                              index == 0
                                                  ? 'Tất cả đánh giá'
                                                  : index.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: AppColors.blueClr,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              index.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14.0),
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                    const CommentItem(),
                    const CommentItem(),
                    const CommentItem(),
                    const CommentItem(),
                  ],
                ),
              ),
            ),
            MyButtonWidget(
                padding: EdgeInsets.zero,
                text: 'Viết đánh giá',
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.CREATE_COMMENT_PAGE);
                },
                color: AppColors.blueClr,
                textStyle: const TextStyle(color: AppColors.whiteClr))
          ],
        ));
  }
}
