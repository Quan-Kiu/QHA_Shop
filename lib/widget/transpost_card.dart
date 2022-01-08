import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/shipping_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'mytext_widget.dart';

class TransPost_Card extends StatelessWidget {
  final ShippingInfo shippingInfo;
  const TransPost_Card({
    Key? key,
    required this.shippingInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> Address = shippingInfo.address.split(',');
    String mainAddress =
        AppExtension.capitalize(Address[Address.length - 1].trim());
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.ORDER_CHECK_PAGE,
            arguments: shippingInfo);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.blueClr, width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextWidget(
                    text: mainAddress,
                    isBold: true,
                    color: AppColors.darkClr,
                    fontSize: 18.0,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppAssetsPath.trashIcon))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                shippingInfo.fullname,
                style: TextStyle(fontSize: 15, letterSpacing: 0.75),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                shippingInfo.address,
                style: TextStyle(fontSize: 15, letterSpacing: 0.75),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                shippingInfo.phone.toString(),
                style: TextStyle(fontSize: 15, letterSpacing: 0.75),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                      width: 135,
                      child: MaterialButton(
                        height: 57,
                        elevation: 0,
                        color: AppColors.blueClr,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
