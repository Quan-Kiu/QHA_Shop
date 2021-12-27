import 'package:flutter/material.dart';

class Category_List {
  final String icon, name;
  final int  id;
  Category_List({
    required this.id,
    required this.icon,
    required this.name,
  });
}

List<Category_List> category = [
  Category_List(
      id: 1,
      name: "Sơ mi nam",
      icon: "shirt.svg",
      ),
  Category_List(
      id: 2,
      name: "Đô lót nữ",
      icon: "bikini.svg",
      ),
  Category_List(
      id: 2,
      name: "Túi xách nam",
      icon: "manbag.svg",
      ),
  Category_List(
      id: 1,
      name: "Quần nam",
      icon: "manpants.svg",
      ),
  Category_List(
      id: 1,
      name: "Giày nam",
      icon: "manshoes.svg",
      ),
  Category_List(
      id: 1,
      name: "Quần lót nam",
      icon: "manunderwear.svg",
      ),
  Category_List(
      id: 1,
      name: "Áo thun nam",
      icon: "tshirt.svg",
      ),
  Category_List(
      id: 1,
      name: "Túi xách nữ",
      icon: "womanbag.svg",
      ),
  Category_List(
      id: 1,
      name: "Quần nữ",
      icon: "womanshoes.svg",
      ),
  Category_List(
      id: 1,
      name: "Giày cao gót",
      icon: "womanpants.svg",
      ),
  Category_List(
      id: 1,
      name: "Ao thun nữ",
      icon: "womantshirt.svg",
      ),
  Category_List(
      id: 1,
      name: "Váy ngắn",
      icon: "skirt.svg",
      ),

  
];


