import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  final String title;
  final String icon;
  final String router;
  final bool active;
  const NavBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.router,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = (active ? AppColors.blueClr : AppColors.grayClr) as Color;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, router);
          },
          icon: SvgPicture.asset(
            icon,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
