class Discount {
  late int id;
  late String code;
  late int price;
  late String drought;
  late int status;

  Discount({
    required this.id,
    required this.code,
    required this.price,
    required this.drought,
    required this.status,
  });

  Discount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    price = json['price'];
    drought = json['drought'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['price'] = this.price;
    data['drought'] = this.drought;
    data['status'] = this.status;
    return data;
  }
}
