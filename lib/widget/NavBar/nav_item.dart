import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/providers/carts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

class NavItem extends StatelessWidget {
  final String title;
  final String icon;
  final String router;
  final bool active;
  const NavItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.router,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var couter = null;
    Color color = (active ? AppColors.blueClr : AppColors.grayClr) as Color;
    if (title == 'Giỏ hàng') {
      couter = context.watch<CartsProvider>().getMyCart.length;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Stack(
          children: [
            couter != null && couter != 0
                ? Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          couter.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteClr),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: AppColors.redClr,
                      ),
                    ))
                : const Text(''),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, router);
              },
              icon: SvgPicture.asset(
                icon,
                color: color,
              ),
            ),
          ],
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
