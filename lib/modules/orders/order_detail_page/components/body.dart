import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/orders/order_detail_page/components/order_info.dart';
import 'package:doan/modules/orders/order_detail_page/components/product_order_item.dart';
import 'package:doan/modules/orders/order_detail_page/components/status_order.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/product.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  List shippingInfos = [
    {'label': 'Thời gian', 'text': '09/12/2022'},
    {'label': 'Đơn vị vận chuyển', 'text': 'Viettel POS'},
    {'label': 'Mã vận đơn', 'text': '000192848573'},
    {'label': 'Địa chỉ', 'text': '257 Nguyễn Thị Thập, Phường Tân Phú, Quận 7'},
  ];
  List paymentInfos = [
    {'label': 'Tạm tính', 'text': 1200000},
    {'label': 'Phí vận chuyển', 'text': 50000},
    {'label': 'Thuể', 'text': 125000},
    {'label': 'Tổng tiền', 'text': 1375000},
  ];

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  StatusOrder(current_status: 3),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: MyTextWidget(
                          text: 'Sản phẩm',
                          isBold: true,
                          color: AppColors.darkClr,
                          fontSize: 18.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: List.generate(
                            products.length,
                            (index) =>
                                ProductOrderItem(product: products[index]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: MyTextWidget(
                          text: 'Thông tin vận chuyển',
                          isBold: true,
                          color: AppColors.darkClr,
                          fontSize: 18.0,
                        ),
                      ),
                      OrderInFo(data: shippingInfos, type: 'shipping'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: MyTextWidget(
                          text: 'Thông tin thanh toán',
                          isBold: true,
                          color: AppColors.darkClr,
                          fontSize: 18.0,
                        ),
                      ),
                      OrderInFo(data: paymentInfos, type: 'payment'),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
        MyButtonWidget(
            text: 'Trở lại',
            onPress: () => Navigator.pushNamed(context, RoutesName.ORDERS_PAGE),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0))
      ],
    );
  }
}
