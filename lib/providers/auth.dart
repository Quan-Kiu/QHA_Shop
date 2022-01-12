import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  Map<String, dynamic> _myAuth = {
    "user": {},
    "token": '',
  };

  get myValue => _myAuth;

  void update(data) {
    _myAuth = data;
    notifyListeners();
  }

  void updateUser(data) {
    _myAuth['user'] = data;
    notifyListeners();
  }
}
