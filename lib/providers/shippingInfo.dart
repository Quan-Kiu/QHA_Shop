import 'package:doan/api/my_api.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/shipping_info.dart';

class ShippingInfoProvider extends ChangeNotifier {
  var _myShippingInfo = [];
  bool _isFirts = false;

  get myShippingInfo => _myShippingInfo;

  addShippingInfo(data) {
    _myShippingInfo.add(data);
    notifyListeners();
  }

  removeShippingInfo(data) {
    _myShippingInfo.remove(data);
    notifyListeners();
  }

  getShippingInfo() async {
    if (!_isFirts) {
      var response =
          await MyApi().getData('shipping_info/getShippingInfoByUser');
      if (response['success'] != null && response['success']) {
        var shippings = response['data']
            .map((data) => ShippingInfo.fromJson(data))
            .toList();
        _myShippingInfo = shippings;
        _isFirts = true;
        notifyListeners();
      }
    }
  }
}
