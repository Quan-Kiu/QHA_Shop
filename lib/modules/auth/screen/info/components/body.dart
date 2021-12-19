// ignore_for_file: unused_import
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/user.dart';
import 'package:doan/modules/auth/screen/info/components/user_preferences.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/profile_widget.dart';
import '../components/button_widget.dart';
import '../components/numbers_widget.dart';
import '../components/profile_widget.dart';
import '../components/user_preferences.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FocusNode myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 30.0)),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {},
              ),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              buildName(user),
            ],
          ),
          const SizedBox(height: 40),
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
        ],
      )),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.black),
          )
        ],
      );

  Widget buildsex(User user) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Icon(Icons.male_outlined, color: AppColors.blueClr),
            Text(
              ' Giới tính: ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),
            Expanded(
                child: Text(
              user.sex,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )),
            Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blueClr),
          ],
        ),
      );

  Widget builddateOB(User user) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Icon(Icons.calendar_today_outlined, color: AppColors.blueClr),
            Text(
              ' Ngày sinh: ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                user.dateOB,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blueClr),
          ],
        ),
      );

  Widget buildemail(User user) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Icon(Icons.email_outlined, color: AppColors.blueClr),
            Text(
              ' Email: ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(user.email,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blueClr),
          ],
        ),
      );

  Widget buildphone(User user) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Icon(Icons.phone_android_outlined, color: AppColors.blueClr),
            Text(
              ' Số điện thoại: ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                user.phone,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blueClr),
          ],
        ),
      );

  Widget buildpassword(User user) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Icon(Icons.lock, color: AppColors.blueClr),
            Text(
              ' Mật khẩu: ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                user.password,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blueClr),
          ],
        ),
      );
}
