import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/pay.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/order_detail.dart';
import 'package:doan/modules/orders/order_detail_page/components/order_info.dart';
import 'package:doan/modules/orders/order_detail_page/components/status_order.dart';
import 'package:doan/utils/alert.dart';
import 'package:doan/utils/handleOrderPayment.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:doan/widget/product_order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Body extends StatefulWidget {
  final order;
  const Body({Key? key, required this.order}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List _order_details = [];
  bool _isLoading = false;

  getOrder() async {
    setState(() {
      _isLoading = true;
    });
    var res = await MyApi().getData('order/${widget.order.id}');
    if (res['success'] != null && res['success']) {
      List order_details =
          res['data'].map((item) => OrderDetail.fromJson(item)).toList();
      setState(() {
        _order_details = order_details;
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
    getOrder();
  }

  @override
  Widget build(BuildContext context) {
    var handleOrderPay = handlePriceOrder(_order_details, null);
    var paymentInfos = handleOrderPay['cartInfos'];
    // ignore: unused_local_variable

    List shippingInfos = [
      {'label': 'Thời gian', 'text': widget.order.deliveryDate},
      {'label': 'Đơn vị vận chuyển', 'text': 'QHA POS'},
      {
        'label': 'Mã đơn hàng',
        'text': AppExtension.capitalize(widget.order.code)
      },
      {'label': 'Địa chỉ', 'text': widget.order.address},
    ];
    var unitPrice = widget.order.unitPrice;
    var discount = (handleOrderPay['amount'] +
            handleOrderPay['shippingPrice'] +
            handleOrderPay['tax']) -
        unitPrice;

    paymentInfos[paymentInfos.length - 1] = {
      'label': 'Tổng tiền',
      'text': unitPrice
    };

    paymentInfos[paymentInfos.length - 2] = {
      'label': 'Giảm giá',
      'text': discount
    };

    return _isLoading
        ? Container(
            alignment: Alignment.center,
            height: 300.0,
            child: const SizedBox(child: CircularProgressIndicator()),
          )
        : Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        widget.order.orderStatusId == 5
                            ? const Text('')
                            : StatusOrder(
                                current_status: widget.order.orderStatus),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Column(
                                children: List.generate(
                                  _order_details.length,
                                  (index) => ProductOrderItem(
                                    data: _order_details[index],
                                    readOnly: true,
                                  ),
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
                  text: widget.order.orderStatus.name == 'Kho'
                      ? 'Hủy đơn hàng'
                      : 'Trở lại',
                  onPress: () async {
                    if (widget.order.orderStatus.name == 'Kho') {
                      var formData = {
                        "address": widget.order.address,
                        "fullname": widget.order.fullname,
                        "phone": widget.order.phone,
                        "delivery_date": widget.order.deliveryDate,
                        "order_status_id": 5,
                      };

                      var res = await MyApi()
                          .putData(formData, 'order/${widget.order.id}');
                      if (res['success'] != null && res['success']) {
                        AlertMessage.showMsg(
                            context, 'Hủy đơn hàng thành công.');
                      } else {
                        AlertMessage.showMsg(
                            context, 'Có lỗi xảy ra, vui lòng thử lại sau.');
                      }
                      Navigator.pushNamed(context, RoutesName.ORDERS_PAGE);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  color: widget.order.orderStatus.name == 'Kho'
                      ? AppColors.redClr
                      : AppColors.blueClr,
                  textStyle: const TextStyle(
                      color: AppColors.whiteClr, fontSize: 16.0),
                  padding: const EdgeInsets.all(10.0))
            ],
          );
  }
}
