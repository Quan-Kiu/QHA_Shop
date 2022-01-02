import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          Positioned(
            top: 0,
            child: Text('Loading'),
          )
        ],
      ),
    );
  }
}
