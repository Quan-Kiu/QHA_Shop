import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        //shape: StadiumBorder(),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        color: AppColors.blueClr,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        textColor: Colors.white,
        onPressed: onClicked,
      );
}

// MyButtonWidget(
//                       padding: const EdgeInsets.only(top: 370.0),
//                       text: "Lưu",
//                       textStyle: const TextStyle(
//                           color: AppColors.whiteClr,
//                           fontWeight: FontWeight.bold),
//                       onPress: () {},
//                       color: AppColors.blueClr,
//                     ),