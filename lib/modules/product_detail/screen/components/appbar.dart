import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text("Nike Air Zoom Pegasus 36 Miami"),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
    ],
  );
}
