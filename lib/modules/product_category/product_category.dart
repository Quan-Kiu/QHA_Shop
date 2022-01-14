import 'dart:async';

import 'package:doan/api/my_api.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/product.dart';
import 'package:doan/providers/product_type.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/product_card.dart';
import 'package:doan/widget/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

// ignore: camel_case_types
class ProductCategory extends StatefulWidget {
  final type;
  const ProductCategory({Key? key, required this.type}) : super(key: key);
  @override
  ProductCategoryState createState() => ProductCategoryState();
}

// ignore: camel_case_types
class ProductCategoryState extends State<ProductCategory> {
  Timer debounce = Timer(const Duration(milliseconds: 100), () {});
  List<dynamic> _resultLst = [];
  String? _value;
  bool _isLoading = false;
  int _total = 0;

  getProduct(type) async {
    setState(() {
      _isLoading = true;
    });
    var res = await MyApi().getData('product/search?product_type_id=$type');
    if (res['success'] != null && res['success']) {
      var products = res['data']['products']
          .map((item) => Product.fromJson(item))
          .toList();
      setState(() {
        _resultLst = products;
        _isLoading = false;
        _total = res['data']['total'];
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getProduct(widget.type);
  }

  @override
  void dispose() {
    debounce.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context, 'Tìm kiếm'),
      appBar: searchInput(context, false, (query) {
        if (debounce.isActive) debounce.cancel();
        debounce = Timer(const Duration(milliseconds: 500), () async {
          List<dynamic> newArr = [];
          int total = 0;
          if (!query.isEmpty) {
            setState(() {
              _isLoading = true;
            });
            var product_type_id = widget.type;
            var api_query = 'name=$query&$product_type_id';
            var res = await MyApi().getData('product/search?$api_query');
            if (res['success'] != null && res['success']) {
              var products = res['data']['products']
                  .map((item) => Product.fromJson(item))
                  .toList();
              newArr = products;
              total = res['data']['total'];
            }
          }
          setState(() {
            _resultLst = newArr;
            _isLoading = false;
            _total = total;
          });
        });
      }),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$_total kết quả',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        )),
                  ],
                ),
                _isLoading
                    ? Container(
                        alignment: Alignment.center,
                        height: 300.0,
                        child:
                            const SizedBox(child: CircularProgressIndicator()),
                      )
                    : _resultLst.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: .55,
                                children: List.generate(
                                    _resultLst.length,
                                    (index) => ProductCard(
                                        product: _resultLst[index]))),
                          )
                        : const AlertModal(
                            icon: AppAssetsPath.cancleIcon,
                            mycolor: AppColors.blueClr,
                            subtitle: 'Không có sản phẩm nào',
                            title: "Rỗng",
                          ),
              ],
            )),
      ),
    );
  }
}
