import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'mytext_widget.dart';

class TransPost_Card extends StatelessWidget {
  final String City, Address;
  final int Phone;
  const TransPost_Card({
    Key? key,
    required this.City,
    required this.Address,
    required this.Phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
      child: Container(
        width: double.infinity,
        height: 250,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.blueClr, width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextWidget(
              text: City,
              isBold: true,
              color: AppColors.darkClr,
              fontSize: 18.0,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              Address,
              style: TextStyle(fontSize: 15, letterSpacing: 0.75),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              Phone.toString(),
              style: TextStyle(fontSize: 15, letterSpacing: 0.75),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                    width: 135,
                    child: MaterialButton(
                      height: 57,
                      elevation: 0,
                      color: AppColors.blueClr,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(235, 240, 255, 1),
                              width: 2.0)),
                      onPressed: () {},
                      child: Row(children: const [
                        Expanded(
                            child: Text(
                          " Chỉnh sửa",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ))
                      ]),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAssetsPath.trashIcon))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}