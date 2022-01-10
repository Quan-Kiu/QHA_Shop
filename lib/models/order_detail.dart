import 'package:doan/models/product.dart';

class OrderDetail {
  late int id;
  late int productId;
  late int orderId;
  late String description;
  late int quantity;
  late int unitPrice;
  late Product product;

  OrderDetail({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.product,
  });

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    description = json['description'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    product =
        (json['product'] != null ? Product.fromJson(json['product']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['unit_price'] = this.unitPrice;
    data['product'] = this.product;
    return data;
  }
}
