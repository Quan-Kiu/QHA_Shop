import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/providers/products.dart';
import 'package:doan/widget/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

// ignore: camel_case_types
class Search_Page extends StatefulWidget {
  const Search_Page({Key? key}) : super(key: key);
  @override
  Search_PageState createState() => Search_PageState();
}

// ignore: camel_case_types
class Search_PageState extends State<Search_Page> {
  List<dynamic> _resultLst = [];
  @override
  Widget build(BuildContext context) {
    List<dynamic> products = context.watch<Products>().myValue['products'];
    return Scaffold(
      appBar: searchInput(context, (query) {
        List<dynamic> newArr = [];
        !query.isEmpty
            ? products.forEach((element) {
                if (newArr.length == 10) {
                  return;
                }
                if (element.name.toLowerCase().contains(query.toLowerCase())) {
                  newArr.add(element);
                }
              })
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
