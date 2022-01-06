import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/carts.dart';
import 'package:doan/models/product.dart';
import 'package:doan/modules/cart/components/discount_code_input.dart';
import 'package:doan/modules/orders/order_detail_page/components/order_info.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/product_order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var myCart = context.watch<CartsProvider>().myCart;
    var amount = 0;
    myCart.forEach((element) {
      amount += (element['total'] * element['product'].price) as int;
    });

    var thue = (amount * 0.1).round();
    var shippingPrice = myCart.length * (amount * 0.02).round();

    final _cartInfos = [
      {'label': 'Số lượng (${myCart.length})', 'text': amount},
      {'label': 'Phí vận chuyển', 'text': shippingPrice},
      {'label': 'Thuể', 'text': thue},
      {'label': 'Tổng tiền', 'text': amount + shippingPrice + thue},
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: myCart != null && myCart.length > 0
            ? Column(
                children: [
                  Column(
                      children: List.generate(
                          myCart.length,
                          (index) => ProductOrderItem(
                                data: myCart[index],
                              ))),
                  const DiscountCodeInput(),
                  OrderInFo(data: _cartInfos, type: 'payment'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  MyButtonWidget(
                      padding: EdgeInsets.zero,
                      text: 'Đặt hàng',
                      onPress: () {
                        Navigator.pushNamed(
                            context, RoutesName.CHECKOUT_TYPE_PAGE);
                      },
                      color: AppColors.blueClr,
                      textStyle: const TextStyle(color: AppColors.whiteClr))
                ],
              )
            : const AlertModal(
                icon: AppAssetsPath.cancleIcon,
                mycolor: AppColors.redClr,
                subtitle: 'Chưa có sản phẩm nào trong giỏ hàng của bạn',
                title: "Rỗng",
              ),
      ),
    );
  }
}
