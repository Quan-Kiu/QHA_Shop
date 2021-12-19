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
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
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
    return SafeArea(
      child: Form(
          child: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Ngày sinh",
              style: TextStyle(
                  color: AppColors.darkClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          buildngaysinh(),
          
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

  Widget buildngaysinh() => TextFormField(
      onTap: () => _selectDate(context),
      controller: _date,
      
      keyboardType: TextInputType.datetime,
      style: AppTextStyles.normalText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Icon(Icons.calendar_today_outlined),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueClr, width: 2.0),
        ),
        // ignore: unnecessary_const
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(235, 240, 255, 1), width: 2.0)
        ),
        
      ));

  Widget buildropdown() => Container(
        child: Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Icon(Icons.date_range_outlined),
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text(
                    'Select date',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  color: AppColors.blueClr,
                ),
              ],
            ),
          ],
        ),
      );
}
