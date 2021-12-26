import 'package:doan/constants.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/search_result.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';

class BodySearchResult extends StatelessWidget {
  const BodySearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 18.0, top: 20.0),
                child: Text(
                  "154 Kết quả",
                  style: TextStyle(
                      color: MyColor.grayClr,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Rating(star_count: 4),
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
