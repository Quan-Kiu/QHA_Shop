import 'package:doan/models/user.dart';

class Comment {
  late int id;
  late String content;
  late int rating;
  late int userId;
  late int productId;
  late String createdAt;
  late User user;

  Comment(
      {required this.id,
      required this.content,
      required this.rating,
      required this.userId,
      required this.productId,
      required this.createdAt,
      required this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    rating = json['rating'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['rating'] = this.rating;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
