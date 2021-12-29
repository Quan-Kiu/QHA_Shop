class Product {
  final String name, description;
  final int id, price;
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;

  Product(this.id, this.name, this.price, this.description, this.images,
      this.sizes, this.colors);
}

List<Product> products = [
  Product(
      1,
      "Nike Air Zoom Pegasus 36 Miami",
      680000,
      "Nike Air Zoom Pegasus 36 Miami React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      ["image_46.png", "image_47.png", "image_48.png", "image_49.png"],
      ["48", "49", "50", "51"],
      ["red", "green"]),
  Product(
      1,
      "Nike Air Max 270 React ENG ",
      980000,
      "Nike Air Max 270 React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      [
        "image_47.png",
        "image_46.png",
        "image_48.png",
        "image_49.png"
      ],
      [
        "46",
        "47",
        "48",
      ],
      [
        "yellow",
        "green"
      ]),
  Product(
    1,
    "Nike Air Vapormax 360",
    280000,
    "Nike Air Vapormax 360 kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
    ["image_48.png", "image_46.png", "image_47.png", "image_49.png"],
    ["48", "49", "50", "51", "52", "53"],
    ["yellow", "blue", "dark", "red", "green"],
  ),
  Product(
      1,
      "Nike Air Max 270 React",
      580000,
      "Nike Air Max 270 React ENG kết hợp đế giữa bằng bọt React có chiều dài đầy đủ với bộ phận 270 Max Air để mang lại sự thoải mái vô song và trải nghiệm hình ảnh ấn tượng.",
      [
        "image_49.png",
        "image_46.png",
        "image_47.png",
        "image_48.png"
      ],
      [
        "46",
        "47",
      ],
      [
        "blue",
        "dark",
        "red",
        "green"
      ]),
];
