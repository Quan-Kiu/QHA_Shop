import 'package:flutter/material.dart';

import 'color_dot.dart';

class ProductSlider extends StatefulWidget {
  final List<String> images;
  const ProductSlider({Key? key, required this.images}) : super(key: key);

  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  int _currentImage = 0;
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 250,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentImage = index;
                    });
                  },
                  itemBuilder: (BuildContext context, index) => Image.network(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                  itemCount: widget.images.length,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length,
                (index) => ColorDot(isSelected: _currentImage == index)),
          ),
        ),
      ]),
    );
  }
}
