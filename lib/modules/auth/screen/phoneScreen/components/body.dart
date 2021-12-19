// ignore_for_file: unused_import
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FocusNode myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String sodienthoai = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          child: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Số điện thoại",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          buildsodienthoai(),
          const SizedBox(
            height: 16,
          ),
          MyButtonWidget(
            padding: const EdgeInsets.only(top: 390.0),
            text: "Lưu",
            textStyle: const TextStyle(
                color: AppColors.whiteClr, fontWeight: FontWeight.bold),
            onPress: () {},
            color: AppColors.blueClr,
          ),
        ],
      )),
    );
  }

  Widget buildsodienthoai() => TextFormField(
      keyboardType: TextInputType.multiline,
      style: AppTextStyles.normalText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Icon(Icons.phone_android_outlined),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(235, 240, 255, 1), width: 2.0)),
      ));
}
