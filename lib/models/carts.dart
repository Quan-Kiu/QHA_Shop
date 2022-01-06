import 'package:doan/models/product.dart';

class Cart {
  final int id;
  final int product_id;
  final int user_id;
  final String description;
  final int quantity;
  final createdAt;
  final updatedAt;

  Cart(this.id, this.product_id, this.user_id, this.description, this.quantity,
      this.createdAt, this.updatedAt);
}
