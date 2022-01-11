class Product {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final int productTypeId;
  final List<String> colors;
  final List<String> sizes;
  final List<String> images;
  final int price;
  final int discount;
  final int stock;
  final int rating;
  final int status;
  final createdAt;
  final updatedAt;
  final deletedAt;

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
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        productTypeId = json['product_type_id'],
        thumbnail = json['thumbnail'],
        colors = json['colors'].cast<String>(),
        sizes = json['sizes'].cast<String>(),
        images = json['images'].cast<String>(),
        price = json['price'],
        discount = json['discount'],
        stock = json['stock'],
        rating = json['rating'],
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
    data['thumbnail'] = this.thumbnail;
    data['size_id'] = this.sizes;
    data['images'] = this.images;
    data['price'] = this.price;
    data['sale'] = this.discount;
    data['stock'] = this.stock;
    data['rating'] = this.rating;
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
      thumbnail:
          "https://res.cloudinary.com/quankiu/image/upload/v1641440703/php1AAE_jmmqjb.png",
      description:
          "Nike Air Zoom Pegasus 36 Miami React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      images: [
        "https://res.cloudinary.com/quankiu/image/upload/v1641440707/php1AAF_ew2fbt.png",
        "https://res.cloudinary.com/quankiu/image/upload/v1641440709/php1ACF_x4ua3s.png",
        "https://res.cloudinary.com/quankiu/image/upload/v1641440710/php1AE0_pu7ybo.png"
      ],
      sizes: ["48", "49", "50", "51"],
      colors: ["red", "green"],
      discount: 500000,
      productTypeId: 2,
      status: 1,
      stock: 10,
      rating: 5),
  Product(
      id: 2,
      name: "Nike Air Zoom Pegasus 37 QK",
      price: 800000,
      thumbnail:
          "https://res.cloudinary.com/quankiu/image/upload/v1641441559/php5649_soqyxr.jpg",
      description:
          "Nike Air Zoom Pegasus 36 Miami React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      images: [
        "https://res.cloudinary.com/quankiu/image/upload/v1641441561/php5659_s6lhtd.jpg",
        "https://res.cloudinary.com/quankiu/image/upload/v1641441564/php565A_nduyfy.jpg",
        "https://res.cloudinary.com/quankiu/image/upload/v1641441566/php565B_qoefws.jpg"
      ],
      sizes: ["48", "49", "50", "51"],
      colors: ["red", "green"],
      discount: 700000,
      productTypeId: 2,
      status: 1,
      stock: 5,
      rating: 5),
];
