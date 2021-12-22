import 'package:doan/constants.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class body extends StatelessWidget {
  const body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Thời trang nam",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: MyColor.darkClr),
                ),
              ],
            ),
          ),
          GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20.0),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
              children: List.generate(products.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                              width: 70,
                              height: 70,
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          AppAssetsPath.DateIcon))),
                              decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 1, color: Colors.grey))))
                          /* child: Image.asset(
                            AppAssetsPath.imagePath + products[index].image,
                          ) */
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        products[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: MyColor.grayClr),
                      ),
                    ),
                  ],
                );
              })),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Thời trang nữ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: MyColor.darkClr),
                ),
              ],
            ),
          ),
          GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20.0),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
              children: List.generate(products.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                              width: 70,
                              height: 70,
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          AppAssetsPath.DateIcon))),
                              decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 1, color: Colors.grey))))
                          /* child: Image.asset(
                            AppAssetsPath.imagePath + products[index].image,
                          ) */
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        products[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: MyColor.grayClr),
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
