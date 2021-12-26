class ProductHome {
  final String name;
  final int id;
  final int price;

  final String images;

  ProductHome(
      {required this.name,
      required this.price,
      required this.images,
      required this.id});
}

List<ProductHome> product_home = [
  ProductHome(
      name: "Nike Air Zoom Pegasus 36 Miami",
      price: 680000,
      images: "image_46.png",
      id: 1),
  ProductHome(
      name: "Nike Air Zoom Pegasus 36 Miami",
      price: 980000,
      images: "image_46.png",
      id: 2),
  ProductHome(
      name: "Nike Air Zoom Pegasus 36 Miami",
      price: 280000,
      images: "image_46.png",
      id: 3),
  ProductHome(
      name: "Nike Air Zoom Pegasus 36 Miami",
      price: 580000,
      images: "image_46.png",
      id: 4),
];
