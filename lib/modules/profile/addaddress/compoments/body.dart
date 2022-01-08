// ignore_for_file: unused_import
import 'package:doan/api/my_api.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/shipping_info.dart';
import 'package:doan/providers/shippingInfo.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/validations.dart';
import 'package:doan/widget/button_select_widger.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController province_cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController communeController = TextEditingController();
  TextEditingController moreController = TextEditingController();

  String fullnameError = '';
  String phoneError = '';
  String province_cityError = '';
  String districtError = '';
  String communeError = '';
  String moreError = '';
  bool _isLoading = false;

  _addShippingInfo() async {
    var isError;
    try {
      isError = Validations.fullname(fullnameController.text, (error) {
        setState(() {
          fullnameError = error;
        });
      });
      isError = Validations.phonenumber(phoneController.text, (error) {
        setState(() {
          phoneError = error;
        });
      });
      isError = Validations.textRequired(
          'Tỉnh/Thành phố', province_cityController.text, (error) {
        setState(() {
          province_cityError = error;
        });
      });
      isError = Validations.textRequired('Quận/Huyện', districtController.text,
          (error) {
        setState(() {
          districtError = error;
        });
      });
      isError =
          Validations.textRequired('Ấp/Xã', communeController.text, (error) {
        setState(() {
          communeError = error;
        });
      });
      isError = Validations.textRequired(
          'Số nhà,thôn,xóm,làng..', moreController.text, (error) {
        setState(() {
          moreError = error;
        });
      });
    } catch (e) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var formData = {
      'fullname': fullnameController.text,
      'phone': phoneController.text,
      'address':
          '${districtController.text}, ${communeController.text}, ${districtController.text}, ${province_cityController.text}',
    };

    var response = await MyApi().postData(formData, 'shipping_info');

    if (response['success'] != null && response['success']) {
      var shippingInfo = ShippingInfo.fromJson(response['data']);
      context.read<ShippingInfoProvider>().addShippingInfo(shippingInfo);
      Navigator.pop(context);
    } else {
      AlertMessage.showMsg(context, response['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phoneController.dispose();
    province_cityController.dispose();
    districtController.dispose();
    communeController.dispose();
    moreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              child: const Text(
                "Họ và tên",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: 'Nhập họ tên',
              prefixIcon: Icons.account_circle_outlined,
              textController: fullnameController,
              errorText: fullnameError,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              child: const Text(
                "Số điện thoại",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: 'Nhập số điện thoại',
              prefixIcon: Icons.phone_android_outlined,
              textController: phoneController,
              errorText: phoneError,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              child: const Text(
                "Địa chỉ",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: 'Nhập Tỉnh/Thành Phố',
              prefixIcon: Icons.location_city_outlined,
              textController: province_cityController,
              errorText: province_cityError,
            ),
            MyTextFormField(
              hintText: 'Nhập Quận/Huyện',
              prefixIcon: Icons.holiday_village,
              textController: districtController,
              errorText: districtError,
            ),
            MyTextFormField(
                hintText: 'Nhập Ấp/Xã',
                prefixIcon: Icons.commute_outlined,
                textController: communeController,
                errorText: communeError),
            MyTextFormField(
              hintText: 'Nhập Số nhà,thôn,xóm,làng...',
              prefixIcon: Icons.location_on_outlined,
              textController: moreController,
              errorText: moreError,
            ),
            MyButtonWidget(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              text: "Thêm địa chỉ",
              textStyle: const TextStyle(
                  color: AppColors.whiteClr, fontWeight: FontWeight.bold),
              onPress: () {
                _addShippingInfo();
              },
              color: AppColors.blueClr,
            ),
          ],
        ),
      ),
    );
  }
}
