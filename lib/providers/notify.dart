import 'package:doan/api/my_api.dart';
import 'package:doan/models/notify.dart';
import 'package:doan/models/productType.dart';
import 'package:flutter/material.dart';

class NotifyProvider extends ChangeNotifier {
  List<dynamic> myNotifies = [];
  int unReadCount = 0;
  bool isFirst = false;

  get get => myNotifies;

  getNotifies() async {
    if (!isFirst) {
      Map<String, dynamic> response = await MyApi().getData('notify');

      if (response['success'] != null && response['success']) {
        var counter = 0;
        var notifies = response['data'].map((data) {
          if (data['isRead'] == 0) {
            counter++;
          }
          return Notify.fromJson(data);
        }).toList();
        unReadCount = counter;
        myNotifies = List.from(notifies.reversed);
      }
    }
  }

  updateIsRead() async {
    if (unReadCount > 0) {
      Map<String, dynamic> response = await MyApi().getData('notify/isRead');
      if (response['success'] != null && response['success']) {
        unReadCount = 0;
        notifyListeners();
      }
    }
  }
}
