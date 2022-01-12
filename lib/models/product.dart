import 'package:doan/models/comment.dart';

class Product {
  late int id;
  late String name;
  late String description;
  late String thumbnail;
  late int productTypeId;
  late List<String> colors;
  late List<String> sizes;
  late List<String> images;
  late int price;
  late int discount;
  late int stock;
  late int rating;
  late int status;
  List<Comment> comments = [];

  Product(
      {required this.id,
      required this.name,
      required this.thumbnail,
      required this.description,
      required this.productTypeId,
      required this.colors,
      required this.sizes,
      required this.images,
      required this.price,
      required this.discount,
      required this.stock,
      required this.rating,
      required this.status,
      required this.comments});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productTypeId = json['product_type_id'];
    thumbnail = json['thumbnail'];
    colors = json['colors'].cast<String>();
    sizes = json['sizes'].cast<String>();
    images = json['images'].cast<String>();
    price = json['price'];
    discount = json['discount'];
    stock = json['stock'];
    rating = (json['rating']).round();
    status = json['status'];
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        if (comments.length <= 5) {
          comments.add(Comment.fromJson(v));
        } else {
          return;
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['product_type_id'] = this.productTypeId;
    data['color_id'] = this.colors;
    data['thumbnail'] = this.thumbnail;
    data['size_id'] = this.sizes;
    data['images'] = this.images;
    data['price'] = this.price;
    data['sale'] = this.discount;
    data['stock'] = this.stock;
    data['rating'] = this.rating;
    data['status'] = this.status;
    return data;
  }
}
