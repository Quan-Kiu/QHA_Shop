// ignore_for_file: unused_import
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/modules/profile/info/components/profile_widget.dart';
import 'package:doan/modules/profile/info/components/user_preferences.dart';
import 'package:doan/modules/profile/sexScreen/components/body.dart';
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

  List<Item> users = <Item>[
    const Item('Nam'),
    const Item('Nữ'),
    const Item('Khác'),
  ];

  var selectedUser;
  final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 130.0),
            child: Row(
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {},
                ),
                const Padding(padding: EdgeInsets.only(left: 20.0)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Họ và tên",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          buildname(),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Giới tính",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButton<Item>(
              hint: const Text("Nam"),
              value: selectedUser,
              isExpanded: true,
              onChanged: (Value) {
                setState(() {
                  selectedUser = Value;
                });
              },
              items: users.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Email",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          buildemail(),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Số điện thoại",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          buildphone(),
          MyButtonWidget(
            padding: const EdgeInsets.all(5),
            text: "Đổi mật khẩu",
            textStyle: const TextStyle(
                color: AppColors.whiteClr, fontWeight: FontWeight.bold),
            onPress: () {
              Navigator.pushNamed(context, RoutesName.CHANGEPASSWORD_PAGE);
            },
            color: AppColors.blueClr,
          ),
          MyButtonWidget(
            padding: const EdgeInsets.all(5),
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

  Widget buildname() => TextFormField(
      keyboardType: TextInputType.multiline,
      style: AppTextStyles.normalText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Icon(Icons.list_outlined),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(235, 240, 255, 1), width: 2.0)),
      ));

  Widget buildemail() => TextFormField(
      keyboardType: TextInputType.multiline,
      style: AppTextStyles.normalText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Icon(Icons.email_outlined),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(235, 240, 255, 1), width: 2.0)),
      ));
  Widget buildphone() => TextFormField(
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
