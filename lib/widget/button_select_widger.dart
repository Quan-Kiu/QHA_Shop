import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

class ButtonSelect extends StatefulWidget {
  final List<String> data;
  final String type;
  const ButtonSelect({Key? key, required this.data, required this.type})
      : super(key: key);

  @override
  _ButtonSelectState createState() => _ButtonSelectState();
}

class _ButtonSelectState extends State<ButtonSelect> {
  int _currentSize = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: AppExtension.capitalize(widget.type),
              isBold: true,
              fontSize: 14,
              color: AppColors.darkClr),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    widget.data.length,
                    (index) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: AppColors.whiteClr,
                              primary: widget.type == "size"
                                  ? AppColors.whiteClr
                                  : AppColors.getColor(widget.data[index]),
                              shape: CircleBorder(
                                side: widget.type == "size"
                                    ? BorderSide(
                                        color: _currentSize == index
                                            ? AppColors.getColor("blue")
                                            : AppColors.lightClr,
                                        width: 2.0)
                                    : BorderSide.none,
                              ),
                              shadowColor: AppColors.whiteClr),
                          onPressed: () {
                            setState(() {
                              _currentSize = index;
                            });
                          },
                          child: widget.type == "size"
                              ? Text(
                                  widget.data[index],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: MyColor.darkClr),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentSize == index
                                          ? widget.data[index] == "white"
                                              ? AppColors.darkClr
                                              : AppColors.whiteClr
                                          : AppColors.getColor(
                                              widget.data[index])),
                                ),
                        ))),
          ),
        ],
      ),
    );
  }
}
