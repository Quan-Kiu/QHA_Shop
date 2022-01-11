import 'package:doan/api/my_api.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/validations.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final product;
  const Body({Key? key, this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _starCount = 5;
  TextEditingController contentController = TextEditingController();
  String _contentError = '';
  bool _isLoading = false;

  _comment() async {
    var isError;

    try {
      isError =
          Validations.textRequired(contentController.text, 'Nội dung', (error) {
        setState(() {
          _contentError = error;
        });
      });
    } catch (e) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var formData = {
      'product_id': widget.product.id,
      'content': contentController.text,
      'rating': _starCount,
    };

    var response = await MyApi().postData(formData, 'comment');

    if (response['success'] != null && response['success']) {
      AlertMessage.showMsg(context, response['message']);
    } else {
      AlertMessage.showMsg(context, response['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

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
                        controller: contentController,
                        style: const TextStyle(fontSize: 14.0),
                        decoration: InputDecoration(
                            errorText:
                                _contentError != '' ? _contentError : null,
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
              onPress: () {
                _comment();
              },
              textStyle: const TextStyle(color: AppColors.whiteClr),
              color: AppColors.blueClr,
              padding: EdgeInsets.zero)
        ],
      ),
    );
  }
}
