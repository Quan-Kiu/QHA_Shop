// ignore_for_file: unused_import
import 'dart:ui';

import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/user.dart';
import 'package:doan/providers/auth.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/profile_widget.dart';
import '../components/button_widget.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FocusNode myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  // ignore: prefer_final_fields, unnecessary_new
  TextEditingController _date = new TextEditingController();
  // ignore: prefer_void_to_null, unused_element
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    User user = context.watch<Auth>().myValue['user'];
    return SafeArea(
      child: Form(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Row(
              children: [
                ProfileWidget(
                  imagePath: '',
                  onClicked: () async {},
                ),
                const Padding(padding: EdgeInsets.only(left: 20.0)),
                buildName(user),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildsex(user),
          const SizedBox(height: 40),
          builddateOB(user),
          const SizedBox(height: 40),
          buildemail(user),
          const SizedBox(height: 40),
          buildphone(user),
          const SizedBox(height: 40),
          buildpassword(user),
          const SizedBox(height: 40),
          MyButtonWidget(
            padding: const EdgeInsets.all(15),
            text: "Chỉnh sửa hồ sơ",
            textStyle: const TextStyle(
                color: AppColors.whiteClr, fontWeight: FontWeight.bold),
            onPress: () {
              Navigator.pushNamed(context, RoutesName.CHANGEPROFILE_PAGE);
            },
            color: AppColors.blueClr,
          ),
        ],
      )),
    );
  }

  Widget buildName(User user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                user.fullname,
                style: const TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              user.email,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.grayClr,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      );

  Widget buildsex(User user) => Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            const Icon(Icons.male_outlined, color: AppColors.blueClr),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            const Text(
              'Giới tính:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.darkClr),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    user.gender,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.grayClr,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget builddateOB(User user) {
    var textButton = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          user.birthday,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: AppColors.grayClr,
          ),
        ),
      ],
    );
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_outlined, color: AppColors.blueClr),
          const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          const Text(
            'Ngày sinh:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.darkClr),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: textButton,
          ),
        ],
      ),
    );
  }

  Widget buildemail(User user) => Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            const Icon(Icons.email_outlined, color: AppColors.blueClr),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            const Text(
              'Email:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.darkClr),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      user.email,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: AppColors.grayClr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildphone(User user) => Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            const Icon(Icons.phone_android_outlined, color: AppColors.blueClr),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            const Text(
              'Số điện thoại:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.darkClr),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    user.phone,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.grayClr,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
          ],
        ),
      );

  Widget buildpassword(User user) => Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            const Icon(Icons.lock, color: AppColors.blueClr),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            const Text(
              'Mật khẩu:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.darkClr),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '*********',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.grayClr,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
          ],
        ),
      );
}
