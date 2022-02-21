import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/accountview.dart';
import 'package:doan/models/order.dart';
import 'package:doan/providers/order_status.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/alert_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'components/order_item.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late List _orders = [];
  bool _isLoading = false;
  var _currentPage = 1;

  // The function that fetches data from the API
  getOrder(type) async {
    setState(() {
      _isLoading = true;
      _currentPage = type;
    });
    var res = await MyApi().getData('order/getOrderByUser?id=$type');
    if (res['success'] != null && res['success']) {
      List orders = res['data'].map((item) => Order.fromJson(item)).toList();
      setState(() {
        _orders = List.from(orders.reversed);
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

    getOrder(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    var orderStatus = context.watch<OrderStatusProvider>().myOrderStatus;
    return Scaffold(
        appBar: buildSecondaryAppBar(context, 'Đặt hàng', {
          "route": RoutesName.ACCOUNT_PAGE,
        }),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      orderStatus.length,
                      (index) => GestureDetector(
                        onTap: () {
                          getOrder(orderStatus[index].id);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            decoration: BoxDecoration(
                                color: orderStatus[index].id == _currentPage
                                    ? AppColors.lightClr
                                    : AppColors.whiteClr,
                                border: Border.all(color: AppColors.lightClr)),
                            constraints: const BoxConstraints(minWidth: 70.0),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: Text(
                                  orderStatus[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.blueClr,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _isLoading
                    ? Container(
                        alignment: Alignment.center,
                        height: 300.0,
                        child:
                            const SizedBox(child: CircularProgressIndicator()),
                      )
                    : _orders.isNotEmpty
                        ? Column(
                            children: List.generate(_orders.length,
                                (index) => OrderItem(order: _orders[index])))
                        : const AlertModal(
                            icon: AppAssetsPath.cancleIcon,
                            mycolor: AppColors.blueClr,
                            subtitle: 'Không có hóa đơn nào',
                            title: "Rỗng",
                          )
              ],
            ),
          ),
        ));
  }
}
