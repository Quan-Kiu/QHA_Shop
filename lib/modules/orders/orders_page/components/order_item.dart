import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:doan/models/order.dart';
import 'package:doan/widget/mytext_widget.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesName.ORDER_DETAUL_PAGE),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightClr, width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                text: order.id,
                isBold: true,
                color: AppColors.darkClr,
                fontSize: 18.0,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Ngày đặt hàng : ${order.createdAt}',
                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(
                height: 30.0,
                child: Center(
                  child: Text(
                    "---------------------------------------------------------------------------------------------------------",
                    maxLines: 1,
                    style: TextStyle(color: AppColors.lightClr),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Trạng thái'),
                  Text(order.status,
                      style: const TextStyle(
                          color: AppColors.darkClr, fontSize: 14.0))
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Số lượng'),
                  Text(order.total.toString(),
                      style:
                          TextStyle(color: AppColors.darkClr, fontSize: 14.0))
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Giá'),
                  Text(
                    AppExtension.moneyFormat(order.unitPrice.toString()),
                    style: AppTextStyles.largeLinkText,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
