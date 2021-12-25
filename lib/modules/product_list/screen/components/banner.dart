import 'package:flutter/material.dart';

class Banner_Discount extends StatelessWidget {
  final String image;
  final String title;
  final String discount;
  const Banner_Discount({
    Key? key,
    required this.image,
    required this.title,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              image,
              width: 319,
              height: 206,
            ),
          ),
          Positioned(
              top: 48,
              left: 42,
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              )),
          Positioned(
              top: 96,
              left: 42,
              child: Row(
                children: [
                  Text(
                    discount,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
