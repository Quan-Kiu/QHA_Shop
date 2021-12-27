import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

class bodyTransPost extends StatelessWidget {
  const bodyTransPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blueClr, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(
                      text: "Hồ Chí Minh",
                      isBold: true,
                      color: AppColors.darkClr,
                      fontSize: 18.0,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "257 Nguyễn Thị Thập Tân Phú Quận 7 ",
                      style: TextStyle(fontSize: 15, letterSpacing: 0.75),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "0868769694",
                      style: TextStyle(fontSize: 15, letterSpacing: 0.75),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                            width: 135,
                            child: MaterialButton(
                              height: 57,
                              elevation: 0,
                              color: AppColors.blueClr,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(235, 240, 255, 1),
                                      width: 2.0)),
                              onPressed: () {},
                              child: Row(children: [
                                Expanded(
                                    child: Text(
                                  " Chỉnh sửa",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ))
                              ]),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.delete_outline_sharp,
                            color: AppColors.grayClr,
                            size: 38.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        MyButtonWidget(
            text: 'Tiếp tục',
            onPress: () => Navigator.pop(context),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0))
      ],
    );
  }
}
