class Notify {
  late int id;
  late String title;
  late String description;
  late int userId;
  late int isRead;
  late String createdAt;

  Notify({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.isRead,
    required this.createdAt,
  });

  Notify.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    isRead = json['isRead'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['isRead'] = this.isRead;
    data['created_at'] = this.createdAt;
    return data;
  }
}
