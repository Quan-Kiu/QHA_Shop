import "package:flutter/material.dart";
import 'package:doan/constants.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;

  const MyTextFormField(
      {Key? key,
      required this.hintText,
      this.obscureText = false,
      required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: TextFormField(
            focusNode: myFocusNode,
            obscureText: obscureText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: MyColor.grayClr),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                hintText: hintText,
                hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Icon(
                    prefixIcon,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: MyColor.blueClr, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(235, 240, 255, 1), width: 2.0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ))));
  }
}
