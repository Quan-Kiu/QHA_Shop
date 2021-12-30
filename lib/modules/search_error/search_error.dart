import 'package:doan/modules/search_error/component/bodySearch.dart';
import 'package:doan/widget/searchInput.dart';
import 'package:flutter/material.dart';

class Search_error extends StatelessWidget {
  const Search_error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchInput(context, () {}),
      body: BodySearch(),
    );
  }
}
