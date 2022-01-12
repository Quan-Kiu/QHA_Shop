import 'package:doan/api/my_api.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/product.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/product_card.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List _liked = [];
  bool _isLoading = false;
  getLiked() async {
    setState(() {
      _isLoading = true;
    });
    var res = await MyApi().getData('user/getLiked');
    if (res['success'] != null && res['success']) {
      List likeds = res['data'].map((item) => Product.fromJson(item)).toList();
      setState(() {
        _liked = List.from(likeds.reversed);
        _isLoading = false;
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
    getLiked();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: _isLoading
            ? Container(
                alignment: Alignment.center,
                height: 300.0,
                child: const SizedBox(child: CircularProgressIndicator()),
              )
            : _liked.isNotEmpty
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: .55,
                    children: List.generate(_liked.length,
                        (index) => ProductCard(product: _liked[index])))
                : const AlertModal(
                    icon: AppAssetsPath.cancleIcon,
                    mycolor: AppColors.blueClr,
                    subtitle: 'Không có sản phẩm nào',
                    title: "Rỗng",
                  ),
      ),
    );
  }
}
