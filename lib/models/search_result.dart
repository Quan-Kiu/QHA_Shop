import 'package:flutter/material.dart';

class Product {
  final String image, name, description;
  final int price, size, id, preprice;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.preprice,
  });
}

List<Product> products = [
  Product(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "image_46.png",
    color: const Color(0xFFAEAEAE),
    preprice: 123,
  ),
  Product(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "image_47.png",
    color: const Color(0xFFAEAEAE),
    preprice: 123,
  ),
  Product(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "image_48.png",
    color: const Color(0xFFAEAEAE),
    preprice: 123,
  ),
  Product(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "image_49.png",
    color: const Color(0xFFAEAEAE),
    preprice: 123,
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
