import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/providers/products.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/product.dart';
import 'package:provider/src/provider.dart';

import 'components/banner.dart';

class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Siêu giảm giá', null),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var discountProducts = context.watch<Products>().myDiscount;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            const Banner_Discount(
              discount: '50%',
              image: AppAssetsPath.banner1Image,
              title: 'Giảm giá sốc',
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: GridView.count(
            //       crossAxisCount: 2,
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       mainAxisSpacing: 15,
            //       crossAxisSpacing: 15,
            //       childAspectRatio: .55,
            //       children: List.generate(products.length,
            //           (index) => ProductCard(product: products[index]))),
            // ),
          ],
        ),
      ),
    );
  }
}
