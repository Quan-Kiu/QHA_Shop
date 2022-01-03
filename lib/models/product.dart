class Product {
  final int id;
  final String name;
  final String description;
  final int productTypeId;
  final List<String> colors;
  final List<String> sizes;
  final List<String> images;
  final int price;
  final int discount;
  final int stock;
  final int status;
  final createdAt;
  final updatedAt;
  final deletedAt;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.productTypeId,
      required this.colors,
      required this.sizes,
      required this.images,
      required this.price,
      required this.discount,
      required this.stock,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        productTypeId = json['product_type_id'],
        colors = json['colors'].cast<String>(),
        sizes = json['sizes'].cast<String>(),
        images = json['images'].cast<String>(),
        price = json['price'],
        discount = json['discount'],
        stock = json['stock'],
        status = json['status'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['product_type_id'] = this.productTypeId;
    data['color_id'] = this.colors;
    data['size_id'] = this.sizes;
    data['images'] = this.images;
    data['price'] = this.price;
    data['sale'] = this.discount;
    data['stock'] = this.stock;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

List<Product> products = [
  Product(
      id: 1,
      name: "Nike Air Zoom Pegasus 36 Miami",
      price: 680000,
      description:
          "Nike Air Zoom Pegasus 36 Miami React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      images: ["image_46.png", "image_47.png", "image_48.png", "image_49.png"],
      sizes: ["48", "49", "50", "51"],
      colors: ["red", "green"],
      discount: 500000,
      productTypeId: 2,
      status: 1,
      stock: 10),
  Product(
      id: 2,
      name: "Nike Air Zoom Pegasus 37 QK",
      price: 800000,
      description:
          "Nike Air Zoom Pegasus 36 Miami React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      images: ["image_46.png", "image_47.png", "image_48.png", "image_49.png"],
      sizes: ["48", "49", "50", "51"],
      colors: ["red", "green"],
      discount: 700000,
      productTypeId: 2,
      status: 1,
      stock: 5),
];
