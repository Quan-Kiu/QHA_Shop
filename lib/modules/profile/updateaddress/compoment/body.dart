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
  final shippinginfo;
  const Body({Key? key, required this.shippinginfo}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String fullnameError = '';
  String phoneError = '';
  String province_cityError = '';
  String districtError = '';
  String communeError = '';
  String moreError = '';
  var selectedInfo;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController =
        TextEditingController(text: widget.shippinginfo.fullname);
    TextEditingController phoneController =
        TextEditingController(text: widget.shippinginfo.phone);
    TextEditingController province_cityController = TextEditingController(
        text: widget.shippinginfo.address.split(",")[3].trim());
    TextEditingController districtController = TextEditingController(
        text: widget.shippinginfo.address.split(",")[2].trim());
    TextEditingController communeController = TextEditingController(
        text: widget.shippinginfo.address.split(",")[1].trim());
    TextEditingController moreController = TextEditingController(
        text: widget.shippinginfo.address.split(",")[0].trim());

    _changeShippingInfo() async {
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
            'T???nh/Th??nh ph???', province_cityController.text, (error) {
          setState(() {
            province_cityError = error;
          });
        });
        isError = Validations.textRequired(
            'Qu???n/Huy???n', districtController.text, (error) {
          setState(() {
            districtError = error;
          });
        });
        isError = Validations.textRequired('Ph?????ng/X??', communeController.text,
            (error) {
          setState(() {
            communeError = error;
          });
        });
        isError = Validations.textRequired(
            'S??? nh??,???p,th??n,x??m,l??ng..', moreController.text, (error) {
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
            '${moreController.text}, ${communeController.text}, ${districtController.text}, ${province_cityController.text}',
      };

      var response = await MyApi()
          .putData(formData, 'shipping_info/${widget.shippinginfo.id}');
      if (response['success'] != null && response['success']) {
        var shippingInfo = ShippingInfo.fromJson(response['data']);
        context.read<ShippingInfoProvider>().updateShippingInfo(shippingInfo);
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

    return SafeArea(
      child: Form(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              child: const Text(
                "H??? v?? t??n",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: 'Nh???p h??? t??n',
              prefixIcon: Icons.account_circle_outlined,
              textController: fullnameController,
              errorText: fullnameError,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              child: const Text(
                "S??? ??i???n tho???i",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: 'Nh???p s??? ??i???n tho???i',
              prefixIcon: Icons.phone_android_outlined,
              textController: phoneController,
              errorText: phoneError,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              child: const Text(
                "?????a ch???",
                style: TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            MyTextFormField(
              hintText: 'Nh???p T???nh/Th??nh Ph???',
              prefixIcon: Icons.location_city_outlined,
              textController: province_cityController,
              errorText: province_cityError,
            ),
            MyTextFormField(
              hintText: 'Nh???p Qu???n/Huy???n',
              prefixIcon: Icons.holiday_village,
              textController: districtController,
              errorText: districtError,
            ),
            MyTextFormField(
                hintText: 'Nh???p Ph?????ng/X??',
                prefixIcon: Icons.commute_outlined,
                textController: communeController,
                errorText: communeError),
            MyTextFormField(
              hintText: 'Nh???p S??? nh??,th??n,x??m,l??ng...',
              prefixIcon: Icons.location_on_outlined,
              textController: moreController,
              errorText: moreError,
            ),
            MyButtonWidget(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              text: "S???a ?????a ch???",
              textStyle: const TextStyle(
                  color: AppColors.whiteClr, fontWeight: FontWeight.bold),
              onPress: () {
                _changeShippingInfo();
              },
              color: AppColors.blueClr,
            ),
          ],
        ),
      ),
    );
  }
}
