import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/pay.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/orders/order_detail_page/components/order_info.dart';
import 'package:doan/providers/carts.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/handleOrderPayment.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/product_order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class OrderCheck extends StatelessWidget {
  final shippingInfo;

  const OrderCheck({Key? key, required this.shippingInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCart = context.watch<CartsProvider>().myCart;
    var discount = context.watch<CartsProvider>().getDiscount;
    var handleOrderPay = handlePriceOrder(myCart, discount);
    var _cartInfos = handleOrderPay['cartInfos'];
    var unitPrice = handleOrderPay['unitPrice'];

    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Đặt hàng', null),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Vui lòng kiểm tra lại đơn hàng của bạn'),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightClr, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Họ tên: ${shippingInfo.fullname}',
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 16.0,
                          color: AppColors.darkClr),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Địa chỉ: ${shippingInfo.address}',
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 16.0,
                          color: AppColors.darkClr),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Số điện thoại: ${shippingInfo.phone}',
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 16.0,
                          color: AppColors.darkClr),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                  children: List.generate(
                      myCart.length,
                      (index) => ProductOrderItem(
                            readOnly: true,
                            data: myCart[index],
                          ))),
              OrderInFo(data: _cartInfos, type: 'payment'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyButtonWidget(
          text: 'Đặt hàng',
          onPress: () async {
            var formData = {
              "fullname": shippingInfo.fullname,
              "address": shippingInfo.address,
              "phone": shippingInfo.phone,
              "unit_price": unitPrice,
            };

            if (discount != null) {
              formData['discount_code'] = discount.code;
            }

            var response = await MyApi().postData(formData, 'order');
            if (response['success'] != null && response['success']) {
              AlertMessage.showMsg(context, response['message']);
              Navigator.pushNamed(context, RoutesName.ORDERS_PAGE);
              context.read<CartsProvider>().set([]);
              context.read<CartsProvider>().setDiscount(null);
            } else {
              AlertMessage.showMsg(
                  context, 'Có lỗi xảy ra, vui lòng thử lại sau.');
            }
          },
          textStyle: const TextStyle(fontSize: 16.0, color: AppColors.whiteClr),
          color: AppColors.blueClr,
          padding: const EdgeInsets.all(20.0)),
    );
  }
}
