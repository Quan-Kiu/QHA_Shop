// ignore_for_file: unused_import

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/user.dart';
import 'package:doan/modules/profile/info/components/profile_widget.dart';
import 'package:doan/providers/auth.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/validations.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cloudinary = CloudinaryPublic('quankiu', 'mfym3il5', cache: false);
  bool isLoading = false;
  List<String> genders = <String>[
    'Nam',
    'Nữ',
    'Khác',
  ];

  var selectedGender;
  String _emailError = '';
  String _fullnameError = '';
  String _phoneError = '';

  _changeInfo(formData, id) async {
    var response = await MyApi().putData(formData, 'user/$id');
    if (response['success'] != null && response['success']) {
      var user = User.fromJson(response['data']);
      context.read<Auth>().updateUser(user);
      AlertMessage.showMsg(context, response['message']);
    } else {
      AlertMessage.showMsg(context, response['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = context.watch<Auth>().myValue['user'];

    TextEditingController _date = TextEditingController(text: user.birthday);
    TextEditingController nameController =
        TextEditingController(text: user.fullname);
    TextEditingController emailController =
        TextEditingController(text: user.email);
    TextEditingController genderController =
        TextEditingController(text: user.gender);
    TextEditingController phoneController =
        TextEditingController(text: user.phone);

    @override
    void dispose() {
      _date.dispose();
      nameController.dispose();
      emailController.dispose();
      genderController.dispose();
      phoneController.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Form(
          child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ProfileWidget(
                    imagePath: user.avatar,
                    onClicked: () {
                      showModalBottomSheet(
                          context: context,
                          builder: ((builder) => ButtomSheet()));
                    },
                  ),
                  isLoading
                      ? Positioned(child: CircularProgressIndicator())
                      : Container(),
                ],
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Họ và tên:",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          MyTextFormField(
            hintText: user.fullname,
            prefixIcon: Icons.list_outlined,
            textController: nameController,
            errorText: _fullnameError,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Giới tính:",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightClr, width: 2.0)),
            child: DropdownButton<String>(
                hint: Text(genderController.text,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                value: selectedGender,
                isExpanded: true,
                onChanged: (Value) {
                  setState(() {
                    selectedGender = Value;
                  });
                },
                items: List.generate(
                    genders.length,
                    (index) => DropdownMenuItem<String>(
                          value: genders[index],
                          child: Row(
                            children: <Widget>[
                              Text(
                                genders[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ))),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Ngày sinh:",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          TextFormField(
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (date.toString().length >= 10) {
                  _date.text = date.toString().substring(0, 10);
                }
              },
              controller: _date,
              readOnly: true,
              keyboardType: TextInputType.datetime,
              style: AppTextStyles.mediumTextBold,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 10, 0),
                  child: Icon(
                    Icons.calendar_today_outlined,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
                ),
                // ignore: unnecessary_const
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(235, 240, 255, 1), width: 2.0)),
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Email:",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          MyTextFormField(
            hintText: user.email,
            prefixIcon: Icons.email_outlined,
            textController: emailController,
            errorText: _emailError,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Số điện thoại:",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          MyTextFormField(
            hintText: user.phone,
            prefixIcon: Icons.phone_android_outlined,
            textController: phoneController,
            errorText: _phoneError,
          ),
          const SizedBox(
            height: 40.0,
          ),
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
            onPress: () {
              var gender;
              if (selectedGender == null) {
                gender = user.gender;
              } else {
                gender = selectedGender;
              }

              var formData = {
                'email': emailController.text,
                'fullname': nameController.text,
                'gender': gender,
                'birthday': _date.text,
                'phone': phoneController.text
              };

              _changeInfo(formData, user.id);
            },
            color: AppColors.blueClr,
          ),
        ],
      )),
    );
  }

  Widget builddateOB(User user) {
    var textButton = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          user.birthday,
          textAlign: TextAlign.right,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          //const Icon(Icons.calendar_today_outlined, color: AppColors.blueClr),
          const Padding(
            padding: EdgeInsets.only(right: 10),
          ),

          const SizedBox(height: 4),
          Expanded(
            child: textButton,
          ),
        ],
      ),
    );
  }

  Widget ButtomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Chọn ảnh",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () => getImage(source: ImageSource.gallery),
                    icon: Icon(Icons.image),
                    label: Text("Chọn ảnh"))
              ],
            )
          ],
        ));
  }

  void getImage({required ImageSource source}) async {
    setState(() {
      isLoading = true;
    });
    final file = await ImagePicker().pickImage(source: source);

    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(file!.path,
            resourceType: CloudinaryResourceType.Image),
      );

      var formData = {"avatar": response.secureUrl};

      var res = await MyApi().patch(formData, 'user/changeAvatar');

      if (res['success'] != null && res['success']) {
        var user = User.fromJson(res['data']);
        context.read<Auth>().updateUser(user);
        AlertMessage.showMsg(context, res['message']);
      }

      setState(() {
        isLoading = false;
      });
    } on CloudinaryException catch (e) {
      setState(() {
        isLoading = false;
      });
      AlertMessage.showMsg(context, e.message);
    }
  }
}
