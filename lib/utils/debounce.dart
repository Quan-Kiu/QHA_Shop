import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  var action;
  var _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
