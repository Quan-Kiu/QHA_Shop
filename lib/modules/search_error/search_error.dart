import 'package:doan/modules/search_error/component/bodySearch.dart';
import 'package:doan/modules/search_error/component/buildAppbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Search_error());
}

class Search_error extends StatelessWidget {
  const Search_error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: buildAppBarSearch(),
        body: BodySearch(),
      ),
    );
  }

  
}
