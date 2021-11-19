import 'package:flutter/material.dart';
import '../constants.dart';
import 'mytext_widget.dart';

class MyHeaderAuth extends StatelessWidget {
  final String title;
  final String subTitle;
  const MyHeaderAuth({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: const EdgeInsets.only(bottom: 27),
          child: Image(
            image: AssetImage(MyImages.logoImage),
            width: 72,
            height: 72,
          ),
        ),
        MyTextWidget(
          text: title,
          isBold: true,
          fontSize: 16,
          color: MyColor.darkClr,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(subTitle),
      ],
    );
  }
}
