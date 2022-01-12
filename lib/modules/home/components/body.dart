// ignore_for_file: unused_import
import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/buttoncate.dart';
import 'package:doan/models/carts.dart';
import 'package:doan/models/product.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/providers/products.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/widget/mybutton_cate_widget.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

List<ButtonCate> buttonCate = [
  ButtonCate("Áo thun nam", AppAssetsPath.shirtIcon, "none"),
  ButtonCate("Đầm", AppAssetsPath.skirtIcon, "none"),
  ButtonCate("Túi xách nam", AppAssetsPath.manbagIcon, "none"),
  ButtonCate("Túi xách nữ", AppAssetsPath.womanbagIcon, "none"),
  ButtonCate("Giày Nam", AppAssetsPath.manshoesIcon, "none"),
  ButtonCate("Giày nữ", AppAssetsPath.womanshoesIcon, "none"),
];

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var products = context.watch<Products>().myValue;
    var discountProducts = context.watch<Products>().myDiscount;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    AppAssetsPath.banner1Image,
                    fit: BoxFit.cover,
                  )),
              Row(
                children: <Widget>[
                  Text('Danh Mục',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.blue.shade900))
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  height: 250,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: .8,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: buttonCate.length,
                      itemBuilder: (BuildContext context, index) {
                        return MyButtonCategory(buttonCate: buttonCate[index]);
                      })),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Giá sốc',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.blue.shade900)),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RoutesName.DISCOUNT_PAGE),
                      child: const Text("Xem thêm...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),
              !discountProducts.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.70,
                          children: List.generate(
                              4,
                              (index) => ProductCard(
                                    product: discountProducts[index],
                                    isShowRating: false,
                                  ))),
                    )
                  : Container(),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    AppAssetsPath.banner2Image,
                    fit: BoxFit.cover,
                  )),
              !products.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: .55,
                          children: List.generate(
                              products.length,
                              (index) =>
                                  ProductCard(product: products[index]))),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
