import 'package:doan/modules/category/components/appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Category_List());
}

class Category_List extends StatelessWidget {
  const Category_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: buildAppBar(),
        body:  Column(
          children: const <Widget>[
            Text("asasasasas"),
          ],
        ),
        bottomNavigationBar: Container(
          height: 75,
          width: double.infinity,
          margin: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}