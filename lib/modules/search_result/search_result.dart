import 'package:doan/modules/search_result/component/BodySearchResult.dart';
import 'package:doan/widget/searchInput.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Search_Result());
}

class Search_Result extends StatelessWidget {
  const Search_Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: searchInput(context, () {}),
        body: BodySearchResult(),
      ),
    );
  }
}
