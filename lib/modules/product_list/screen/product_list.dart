import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/product.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/product.dart';
import '../../../constants.dart';
import 'components/banner.dart';
import 'components/buildAppbar.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBar(),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Banner_Discount(
            discount: '50%',
            image: AppAssetsPath.banner1Image,
            title: 'Giảm giá sốc',
          ),
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20.0),
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 1.1,
              children: List.generate(products.length, (index) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              AppAssetsPath.imagePath +
                                  products[index].images[0],
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(
                        products[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: MyColor.darkClr),
                      ),
                      const Rating(star_count: 4),
                      Text(
                        AppExtension.moneyFormat(
                            products[index].price.toString()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: MyColor.blueClr),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppExtension.moneyFormat(
                                products[index].price.toString()),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: MyColor.grayClr),
                          ),
                          const Text(
                            "Giảm 24%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: MyColor.redClr),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              })),
        ],
      ),
    );
  }
}
