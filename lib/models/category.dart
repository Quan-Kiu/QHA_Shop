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
      id: 1,
      name: "Nike ",
      price: 680,
      size: 12,
      description: dummyText,
      image: "dress.svg",
      color: const Color(0xFF3D82AE),
      preprice: 123),
  Product(
      id: 2,
      name: "Belt Bag",
      price: 680,
      size: 8,
      description: dummyText,
      image: "dress.svg",
      color: const Color(0xFFD3A984),
      preprice: 123),
  Product(
      id: 3,
      name: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "dress.svg",
      color: const Color(0xFF989493),
      preprice: 123),
  Product(
      id: 4,
      name: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "dress.svg",
      color: const Color(0xFFE6B398),
      preprice: 123),
  Product(
      id: 5,
      name: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "dress.svg",
      color: const Color(0xFFFB7883),
      preprice: 123),
  Product(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "dress.svg",
    color: const Color(0xFFAEAEAE),
    preprice: 123,
  ),
  Product(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "dress.svg",
    color: const Color(0xFFAEAEAE),
    preprice: 123,
  ),
  
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
