import 'package:doan/api/my_api.dart';

class Order {
  late int id;
  late String code;
  late int userId;
  late String fullname;
  late String address;
  late String phone;
  late int unitPrice;
  late int quantity;
  late String deliveryDate;
  late int orderStatusId;
  late String created_at;
  late OrderStatus orderStatus;

  var deletedAt;

  Order({
    required this.id,
    required this.code,
    required this.userId,
    required this.fullname,
    required this.address,
    required this.phone,
    required this.unitPrice,
    required this.quantity,
    required this.deliveryDate,
    required this.orderStatusId,
    required this.created_at,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userId = json['user_id'];
    fullname = json['fullname'];
    address = json['address'];
    phone = json['phone'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    deliveryDate = json['delivery_date'];
    orderStatusId = json['order_status_id'];
    created_at = json['created_at'];
    orderStatus = (json['order_status'] != null
        ? OrderStatus.fromJson(json['order_status'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['user_id'] = this.userId;
    data['fullname'] = this.fullname;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['delivery_date'] = this.deliveryDate;
    data['order_status_id'] = this.orderStatusId;
    data['created_at'] = this.created_at;
    if (this.orderStatus != null) {
      data['order_status'] = this.orderStatus.toJson();
    }
    return data;
  }
}

class OrderStatus {
  late int id;
  late String name;

  OrderStatus({
    required this.id,
    required this.name,
  });

  OrderStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
