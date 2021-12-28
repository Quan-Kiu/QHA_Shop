// ignore_for_file: unused_import
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/buttoncate.dart';
import 'package:doan/models/home_product.dart';
import 'package:doan/widget/mybutton_cate_widget.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

List<ButtonCate> buttonCate = [
  ButtonCate("Áo thun nam", AppAssetsPath.shirtIcon, "none"),
  ButtonCate("Đầm", AppAssetsPath.skirtIcon, "none"),
  ButtonCate("Túi xách nam", AppAssetsPath.manbagIcon, "none"),
  ButtonCate("Túi xách nữ", AppAssetsPath.womanbagIcon, "none"),
  ButtonCate("Giày Nam", AppAssetsPath.manshoesIcon, "none"),
  ButtonCate("Giày nữ", AppAssetsPath.womanshoesIcon, "none"),
];

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(AppAssetsPath.banner1Image),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Text('Danh Mục',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.blue.shade900))
                ],
              ),
            ),
            SizedBox(
                height: 230,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            childAspectRatio: 1 / 1,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16),
                    itemCount: buttonCate.length,
                    itemBuilder: (BuildContext context, index) {
                      return MyButtonCategory(buttonCate: buttonCate[index]);
                    })),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giá sốc',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.blue.shade900)),
                  TextButton(
                    child: const Text("Xem thêm...",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        )),
                    onPressed: () => {},
                  )
                ],
              ),
            ),
            
            Container(
              child: Column(
                children: <Widget>[
                  GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                      children: List.generate(
                        product_home.length,
                        (index) => SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(AppAssetsPath.imagePath +
                                    product_home[index].images),
                              ),
                              Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              product_home[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppExtension.moneyFormat(
                                          product_home[index].price.toString()),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blueClr,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("1.200.000đ",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough)),
                              ),
                              Text(
                                "Giảm 24%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.redClr),
                              ),
                            ],
                          ),)
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(AppAssetsPath.banner2Image),
                    ],
                  ),
            Container(
              child: Column(
                children: <Widget>[
                  GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                      children: List.generate(
                        product_home.length,
                        (index) => SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(AppAssetsPath.imagePath +
                                    product_home[index].images),
                              ),
                              Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              product_home[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppExtension.moneyFormat(
                                          product_home[index].price.toString()),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blueClr,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("1.200.000đ",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough)),
                              ),
                              Text(
                                "Giảm 24%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.redClr),
                              ),
                            ],
                          ),)
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
