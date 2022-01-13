class ProductType {
  late int id;
  late String name;
  late int status;

  ProductType({
    required this.id,
    required this.name,
    required this.status,
  });

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}
