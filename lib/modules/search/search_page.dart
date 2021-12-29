import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/models/product.dart';
import 'package:doan/modules/search/components/searchInput.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Search_Page extends StatefulWidget {
  const Search_Page({Key? key}) : super(key: key);
  @override
  Search_PageState createState() => Search_PageState();
}

// ignore: camel_case_types
class Search_PageState extends State<Search_Page> {
  List<Product> _resultLst = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchInput(context, (query) {
        List<Product> newArr = [];
        !query.isEmpty
            ? newArr.addAll(products
                .where((element) =>
                    element.name.toLowerCase().contains(query.toLowerCase()))
                .take(10))
            : newArr = [];
        setState(() {
          _resultLst = newArr;
        });
      }),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: ListView.builder(
              itemCount: _resultLst.length,
              itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, RoutesName.PRODUCT_DETAIL_PAGE,
                          arguments: _resultLst[index]),
                      child: Text(
                        _resultLst[index].name,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ))),
    );
  }
}
