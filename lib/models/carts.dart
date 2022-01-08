import 'package:doan/models/product.dart';

class Cart {
  final int id;
  var product;
  final int user_id;
  final String description;
  final int quantity;
  final createdAt;
  final updatedAt;

  Cart(this.id, this.user_id, this.description, this.quantity, this.createdAt,
      this.updatedAt, this.product);

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        product = json['product'],
        user_id = json['user_id'],
        description = json['description'],
        quantity = json['quantity'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}
