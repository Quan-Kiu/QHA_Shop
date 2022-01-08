class ShippingInfo {
  late int id;
  late int userId;
  late String address;
  late String fullname;
  late String phone;
  var deletedAt;
  var createdAt;
  var updatedAt;

  ShippingInfo(
      {required this.id,
      required this.userId,
      required this.address,
      required this.fullname,
      required this.phone,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    fullname = json['fullname'];
    phone = json['phone'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['fullname'] = this.fullname;
    data['phone'] = this.phone;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
