// ignore_for_file: unused_import

import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/user.dart';
import 'package:doan/modules/profile/info/components/profile_widget.dart';
import 'package:doan/modules/profile/sexScreen/components/body.dart';
import 'package:doan/providers/auth.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

uploadImage() async {
  var request =
      http.MultipartRequest("POST", Uri.parse("https://api.imgur.com/3/image"));
  request.fields['title'] = "";
  request.headers['Authorization'] = "";

  var picture = http.MultipartFile.fromBytes(
      'image',
      (await rootBundle.load("assets/images/PromotionImage.png"))
          .buffer
          .asUint8List(),
      filename: 'PromotionImage.png');

  request.files.add(picture);
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var result = String.fromCharCodes(responseData);
  print(result);
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
  _changeInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('qhatoken');
    print(token);
    var formData = {
      'email': 'quankiugl@gmail.com',
      'fullname': 'Quan Kiu Kiu',
    };
    var response = await MyApi().putData(formData, 'user/1');
    if (response['success'] != null && response['success']) {
      var user = User.fromJson(response['data']);
      context.read<Auth>().updateUser(user);
      AlertMessage.showMsg(context, response['message']);
    } else {
      AlertMessage.showMsg(context, response['message']);
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfbirthController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TextEditingController _date = TextEditingController();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
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
        padding: const EdgeInsets.all(15.0),
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 130.0),
            child: Row(
              children: [
                ProfileWidget(
                  imagePath: AppAssetsPath.ProfilePicture,
                  onClicked: () async {
                    uploadImage();
                  },
                ),
                const Padding(padding: EdgeInsets.only(left: 20.0)),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
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
              "Ngày sinh:",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          TextFormField(
              onTap: () => _selectDate(context),
              controller: _date,
              keyboardType: TextInputType.datetime,
              style: AppTextStyles.normalText,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                hintStyle: TextStyle(fontWeight: FontWeight.normal),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Icon(Icons.calendar_today_outlined,color:AppColors.blueClr ,),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
                ),
                // ignore: unnecessary_const
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.blueClr, width: 2.0)),
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
              _changeInfo();
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
}
