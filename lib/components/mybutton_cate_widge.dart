import 'package:doan/models/buttoncate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

// ignore: must_be_immutable
class MyButtonCategory extends StatelessWidget {
  final ButtonCate buttonCate;
  const MyButtonCategory({Key? key, required this.buttonCate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Ink(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.lightClr, width: 1.0),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: SvgPicture.asset(buttonCate.icon),
              iconSize: 25,
              color: MyColor.blueClr,
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          buttonCate.label,
          style: const TextStyle(fontSize: MyTextSize.smallText),
        )
      ],
    );
  }
}
