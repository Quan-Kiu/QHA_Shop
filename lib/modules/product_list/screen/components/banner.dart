import 'package:flutter/material.dart';

class Banner_Discount extends StatelessWidget {
  final String image;
  final String title;
  final String discount;
  const Banner_Discount({
    Key? key,
    required this.image, required this.title, required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            image,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 40,
              left: 10,
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )
                ],
              )),
          Positioned(
              top: 80,
              left: 10,
              child: Row(
                children: [
                  Text(
                    discount,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
