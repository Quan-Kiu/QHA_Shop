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
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FocusNode myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String sothe = '';
  String tenchuthe = '';
  String ngayhethan = '';
  String mabaomat = '';
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Số thẻ",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            buildSothe(),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Tên chủ thẻ",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            buildTenchuthe(),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Ngày hết hạn",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            buildNgayhethan(),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Mã bảo mật",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            buildMbaomat(),
            MyButtonWidget(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              text: "Thêm",
              textStyle: const TextStyle(
                  color: AppColors.whiteClr, fontWeight: FontWeight.bold),
              onPress: () {},
              color: AppColors.blueClr,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSothe() => TextFormField(
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueClr, width: 2.0)),
      ));

  Widget buildTenchuthe() => TextFormField(
      keyboardType: TextInputType.multiline,
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueClr, width: 2.0)),
      ));

  Widget buildNgayhethan() => TextFormField(
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueClr, width: 2.0)),
      ));
      
  Widget buildMbaomat() => TextFormField(
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueClr, width: 2.0)),
      ));
}
