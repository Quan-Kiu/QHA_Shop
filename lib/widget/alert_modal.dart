import 'package:doan/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertModal extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color mycolor;
  final String icon;
  const AlertModal({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.mycolor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 175),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                    width: 72,
                    height: 72,
                    child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              icon,
                            ))),
                    decoration: ShapeDecoration(
                        color: mycolor,
                        shape: CircleBorder(
                            side: BorderSide(width: 10, color: mycolor)))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: MyColor.darkClr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColor.grayClr, fontSize: 15, letterSpacing: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
