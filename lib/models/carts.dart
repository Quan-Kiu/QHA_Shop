import 'package:doan/models/product.dart';

class Cart {
  final int id;
  late Product product;
  final int user_id;
  final String description;
  final int quantity;

  Cart(this.id, this.user_id, this.description, this.quantity, this.product);

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        product = (json['product'] != null
            ? Product.fromJson(json['product'])
            : null)!,
        user_id = json['user_id'],
        description = json['description'],
        quantity = json['quantity'];
}
