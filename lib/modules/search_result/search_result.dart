import 'package:doan/modules/search_error/component/buildAppbar.dart';
import 'package:doan/modules/search_result/component/BodySearchResult.dart';
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
        appBar: buildAppBarSearch(),
        body: BodySearchResult(),
      ),
    );
  }
}


