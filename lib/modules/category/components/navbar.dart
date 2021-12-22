import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  final String title;
  final String icon;
  const NavBar({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        IconButton(
          onPressed: () {
            /* Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomeScreen())); */
          },
          icon: SvgPicture.asset(icon),
          color: Colors.blue,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
