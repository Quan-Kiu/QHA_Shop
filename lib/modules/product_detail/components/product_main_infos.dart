import 'package:doan/api/my_api.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/category.dart';
import 'package:doan/models/user.dart';
import 'package:doan/providers/auth.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

class ProductMainInfos extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  const ProductMainInfos({Key? key, this.product}) : super(key: key);
  @override
  _ProductMainInfosState createState() => _ProductMainInfosState();
}

class _ProductMainInfosState extends State<ProductMainInfos> {
  late bool isLiked = false;
  _checkLiked() {
    var user = context.watch<Auth>().myValue['user'];
    user.liked.forEach((item) {
      if (item == widget.product.id) {
        setState(() {
          isLiked = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkLiked();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.product.name,
                style: const TextStyle(
                    color: AppColors.darkClr,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
                onPressed: () async {
                  var res;
                  if (isLiked == false) {
                    res = await MyApi()
                        .patch(null, 'user/like/${widget.product.id}');
                  } else {
                    res = await MyApi()
                        .patch(null, 'user/unlike/${widget.product.id}');
                  }
                  if (res['success'] != null && res['success']) {
                    var user = User.fromJson(res['data']);
                    context.read<Auth>().updateUser(user);
                    setState(() {
                      isLiked = !isLiked;
                    });
                  }
                },
                icon: SvgPicture.asset(
                  AppAssetsPath.likeIcon,
                  color: isLiked ? AppColors.redClr : AppColors.grayClr,
                ))
          ],
        ),
        Rating(star_count: widget.product.rating),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(AppExtension.moneyFormat(widget.product.discount.toString()),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: AppColors.blueClr,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                width: 10.0,
              ),
              Text(AppExtension.moneyFormat(widget.product.price.toString()),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 16.0)),
            ],
          ),
        ),
      ],
    );
  }
}
