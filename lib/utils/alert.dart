import 'package:flutter/material.dart';

class AlertMessage {
  static showMsg(context, msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(msg,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
      action: SnackBarAction(
        label: 'Đóng',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
