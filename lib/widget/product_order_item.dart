import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/product.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductOrderItem extends StatefulWidget {
  final Product product;
  final readOnly;
  const ProductOrderItem(
      {Key? key, required this.product, this.readOnly = false})
      : super(key: key);

  @override
  _ProductOrderItemState createState() => _ProductOrderItemState();
}

class _ProductOrderItemState extends State<ProductOrderItem> {
  int _currentAmount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightClr, width: 1.0)),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child:
                Image.asset(AppAssetsPath.imagePath + widget.product.images[0]),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyTextWidget(
                        text: widget.product.name,
                        isBold: true,
                        color: AppColors.darkClr,
                        fontSize: 16.0,
                      ),
                    ),
                    !widget.readOnly
                        ? IconButton(
                            icon: SvgPicture.asset(AppAssetsPath.trashIcon),
                            onPressed: () {},
                          )
                        : const Text('')
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppExtension.moneyFormat(
                            widget.product.price.toString()),
                        style: AppTextStyles.largeLinkText,
                      ),
                    ),
                    !widget.readOnly
                        ? Container(
                            height: 25.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                border: Border.all(color: AppColors.lightClr)),
                            child: Row(
                              children: [
                                handleAmount('minus', () {
                                  setState(() {
                                    _currentAmount != 1
                                        ? _currentAmount--
                                        : _currentAmount;
                                  });
                                }),
                                Container(
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: 30.0,
                                    color: AppColors.lightClr,
                                    child: Text(_currentAmount.toString())),
                                handleAmount('plus', () {
                                  setState(() {
                                    _currentAmount++;
                                  });
                                }),
                              ],
                            ),
                          )
                        : const Text('')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

IconButton handleAmount(String type, onPress) => IconButton(
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
    onPressed: onPress,
    icon: SvgPicture.asset(
      type == 'plus' ? AppAssetsPath.plusIcon : AppAssetsPath.minusIcon,
    ));
