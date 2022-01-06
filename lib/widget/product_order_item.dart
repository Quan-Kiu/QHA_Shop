import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

class ProductOrderItem extends StatefulWidget {
  final dynamic data;
  // ignore: prefer_typing_uninitialized_variables
  final readOnly;
  const ProductOrderItem({Key? key, this.readOnly = false, this.data})
      : super(key: key);

  @override
  _ProductOrderItemState createState() => _ProductOrderItemState();
}

class _ProductOrderItemState extends State<ProductOrderItem> {
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
            child: Image.network(widget.data['product'].thumbnail),
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
                        text: widget.data['product'].name,
                        isBold: true,
                        color: AppColors.darkClr,
                        fontSize: 16.0,
                      ),
                    ),
                    !widget.readOnly
                        ? IconButton(
                            icon: SvgPicture.asset(AppAssetsPath.trashIcon),
                            onPressed: () {
                              context.read<CartsProvider>().delete(widget.data);
                            },
                          )
                        : const Text('')
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.data['description'],
                  style: const TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppExtension.moneyFormat(
                            widget.data['product'].price.toString()),
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: AppColors.blueClr,
                            fontWeight: FontWeight.bold),
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
                                    if (widget.data['total'] > 1) {
                                      context.read<CartsProvider>().update(
                                          widget.data,
                                          "total",
                                          --widget.data['total']);
                                    }
                                  });
                                }),
                                Container(
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: 30.0,
                                    color: AppColors.lightClr,
                                    child:
                                        Text(widget.data['total'].toString())),
                                handleAmount('plus', () {
                                  setState(() {
                                    context.read<CartsProvider>().update(
                                        widget.data,
                                        "total",
                                        ++widget.data['total']);
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
