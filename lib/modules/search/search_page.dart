import 'dart:async';

import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/product.dart';
import 'package:doan/providers/product_type.dart';
import 'package:doan/providers/products.dart';
import 'package:doan/widget/NavBar/bottom_navbar.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/product_card.dart';
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
  Timer debounce = Timer(const Duration(milliseconds: 100), () {});
  List<dynamic> _resultLst = [];
  String? _value;
  bool _isLoading = false;
  int _total = 0;
  @override
  void dispose() {
    debounce.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productType = context.watch<ProductTypeProvider>().get;
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context, 'Tìm kiếm'),
      appBar: searchInput(context, (query) {
        if (debounce.isActive) debounce.cancel();
        debounce = Timer(const Duration(milliseconds: 500), () async {
          List<dynamic> newArr = [];
          int total = 0;
          if (!query.isEmpty) {
            setState(() {
              _isLoading = true;
            });
            var product_type_id =
                _value != null ? 'product_type_id=$_value' : '';
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
                    DropdownButton<String>(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                      items: List.generate(
                          productType.length,
                          (index) => DropdownMenuItem<String>(
                                child: Text(
                                  productType[index].name,
                                  style: const TextStyle(
                                      color: AppColors.blackClr),
                                ),
                                value: productType[index].id.toString(),
                              )),
                      onChanged: (String? value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      hint: const Text('Chọn loại'),
                      value: _value,
                    ),
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
