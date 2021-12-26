import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _starCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyTextWidget(
                      text:
                          'Vui lòng viết Mức độ hài lòng chung với Dịch vụ vận chuyển / Giao hàng của bạn',
                      isBold: true,
                      fontSize: 16.0,
                      color: AppColors.darkClr),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Rating(
                      star_count: _starCount,
                      countTextShow: true,
                      size: 'lg',
                      onPress: (index) {
                        setState(() {
                          _starCount = index + 1;
                        });
                      },
                    ),
                  ),
                  const MyTextWidget(
                      text: 'Đánh giá của bạn',
                      isBold: true,
                      fontSize: 16.0,
                      color: AppColors.darkClr),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                        maxLines: 6,
                        style: const TextStyle(fontSize: 14.0),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15.0),
                            hintText: 'Viết nhận xét của bạn ở đây.',
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.blueClr, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(235, 240, 255, 1),
                                    width: 2.0)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ))),
                  )
                ],
              ),
            ),
          ),
          MyButtonWidget(
              text: 'Đánh giá',
              onPress: () {},
              textStyle: const TextStyle(color: AppColors.whiteClr),
              color: AppColors.blueClr,
              padding: EdgeInsets.zero)
        ],
      ),
    );
  }
}
