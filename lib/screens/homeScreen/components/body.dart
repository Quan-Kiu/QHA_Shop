import 'package:doan/components/mybutton_cate_widge.dart';
import 'package:doan/constants.dart';
import 'package:doan/models/buttoncate.dart';
import 'package:flutter/material.dart';

List<ButtonCate> buttonCate = [
  ButtonCate("Áo thun nam", MyIcons.shirtIcon, "none"),
  ButtonCate("Đầm", MyIcons.skirtIcon, "none"),
  ButtonCate("Túi xách nam", MyIcons.manbagIcon, "none"),
  ButtonCate("Túi xách nữ", MyIcons.womanbagIcon, "none"),
  ButtonCate("Giày Nam", MyIcons.manshoesIcon, "none"),
  ButtonCate("Giày nữ", MyIcons.womanshoesIcon, "none"),
];

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
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
          const SizedBox(
            height: 25,
          ),
          SizedBox(
              height: 330,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: buttonCate.length,
                  itemBuilder: (BuildContext context, index) {
                    return MyButtonCategory(buttonCate: buttonCate[index]);
                  })),
        ],
      ),
    );
  }
}
// GridView.count(
//               crossAxisCount: 4,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16,
//               shrinkWrap: true,
//               padding: const EdgeInsets.only(left: 24, right: 24),
//               children: 
//             ),