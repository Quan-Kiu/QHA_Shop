import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/productdiscount.dart';
import '../../../constants.dart';
import 'components/banner.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Siêu giảm giá'),
      body: const Body(),
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
              childAspectRatio: 0.75,
              children: List.generate(products.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            AppAssetsPath.imagePath + products[index].image,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        products[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: MyColor.darkClr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Rating(star_count: 4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        AppExtension.moneyFormat(
                            products[index].price.toString()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: MyColor.blueClr),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppExtension.moneyFormat(
                                products[index].preprice.toString()),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: MyColor.grayClr),
                          ),
                          const Text(
                            "Giảm 24%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: MyColor.redClr),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              })),
        ],
      ),
    );
  }
}
