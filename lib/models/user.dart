class User {
  final int id;
  final String fullname;
  final String email;
  final String phone;
  final String avatar;
  final String address;
  final String gender;
  final List<dynamic> liked;
  final int status;
  final int userTypeId;
  final birthday;
  final deletedAt;
  final emailVerifiedAt;
  final createdAt;
  final updatedAt;

  User(
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.avatar,
    this.birthday,
    this.status,
    this.deletedAt,
    this.userTypeId,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.liked,
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullname = json['fullname'],
        email = json['email'],
        phone = json['phone'] ?? '',
        avatar = json['avatar'],
        address = json['address'] ?? '',
        gender = json['gender'] ?? '',
        birthday = json['birthday'] ?? '',
        liked = json['liked'] ?? [],
        status = json['status'],
        deletedAt = json['deleted_at'],
        userTypeId = json['user_type_id'],
        emailVerifiedAt = json['email_verified_at'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['birthday'] = this.birthday;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['user_type_id'] = this.createdAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// ignore: camel_case_types
class iicon {
  final String icon;
  final String link;

  iicon(this.icon, this.link);
}
