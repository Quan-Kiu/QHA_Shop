import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/product.dart';
import 'package:doan/modules/cart/components/discount_code_input.dart';
import 'package:doan/modules/orders/order_detail_page/components/order_info.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/product_order_item.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _cartInfos = [
    {'label': 'Số lượng (3)', 'text': 1200000},
    {'label': 'Phí vận chuyển', 'text': 50000},
    {'label': 'Thuể', 'text': 125000},
    {'label': 'Tổng tiền', 'text': 1375000},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                      children: List.generate(
                          products.length,
                          (index) => ProductOrderItem(
                                product: products[index],
                              ))),
                  const DiscountCodeInput(),
                  OrderInFo(data: _cartInfos, type: 'payment'),
                  const SizedBox(
                    height: 15.0,
                  )
                ],
              ),
            ),
          ),
          MyButtonWidget(
              padding: EdgeInsets.zero,
              text: 'Đặt hàng',
              onPress: () {
                Navigator.pushNamed(context, RoutesName.CHECKOUT_TYPE_PAGE);
              },
              color: AppColors.blueClr,
              textStyle: const TextStyle(color: AppColors.whiteClr))
        ],
      ),
    );
  }
}
