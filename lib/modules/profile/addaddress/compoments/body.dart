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

  TextEditingController nameController = TextEditingController();

  String ho = '';
  String ten = '';
  String diachi = '';
  String sdt = '';

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
                "Họ và tên",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: '',
              prefixIcon: Icons.list_alt_outlined,
              textController: nameController,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Địa chỉ",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: '',
              prefixIcon: Icons.location_city_outlined,
              textController: nameController,
            ),
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
            MyTextFormField(
              hintText: '',
              prefixIcon: Icons.phone_android_outlined,
              textController: nameController,
            ),


            
            MyButtonWidget(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              text: "Thêm địa chỉ",
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

  
}
