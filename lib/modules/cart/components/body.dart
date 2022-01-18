import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/pay.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/cart/components/discount_code_input.dart';
import 'package:doan/modules/orders/order_detail_page/components/order_info.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/handleOrderPayment.dart';
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
    var discount = context.watch<CartsProvider>().getDiscount;
    var handleOrderPay = handlePriceOrder(myCart, discount);
    var _cartInfos = handleOrderPay['cartInfos'];
    var _isOutOfStock = handleOrderPay['isOutOfStock'];
    // ignore: unused_local_variable
    var unitPrice = handleOrderPay['unitPrice'];
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: myCart.isEmpty
            ? const AlertModal(
                icon: AppAssetsPath.cancleIcon,
                mycolor: AppColors.blueClr,
                subtitle: 'Chưa có sản phẩm nào trong giỏ hàng của bạn',
                title: "Rỗng",
              )
            : Column(
                children: [
                  Column(
                      children: List.generate(
                          myCart.length,
                          (index) => ProductOrderItem(
                                data: myCart[index],
                              ))),
                  DiscountCodeInput(
                    discount: discount != null ? discount.code : '',
                  ),
                  OrderInFo(data: _cartInfos, type: 'payment'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  MyButtonWidget(
                      padding: EdgeInsets.zero,
                      text: 'Thanh toán',
                      onPress: () {
                        if (_isOutOfStock) {
                          return AlertMessage.showMsg(context,
                              'Giỏ hàng tồn tại sản phẩm không đủ số lượng tồn kho để cung cấp, vui lòng kiểm tra lại.');
                        }
                        Navigator.pushNamed(
                            context, RoutesName.CHECKOUT_TYPE_PAGE);
                      },
                      color: AppColors.blueClr,
                      textStyle: const TextStyle(color: AppColors.whiteClr))
                ],
              ),
      ),
    );
  }
}
