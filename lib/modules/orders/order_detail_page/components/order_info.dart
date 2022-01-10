import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/extenstion/app_extension.dart';
import 'package:flutter/material.dart';

class OrderInFo extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  // ignore: prefer_typing_uninitialized_variables
  final type;

  const OrderInFo({
    Key? key,
    this.data,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightClr, width: 1.0)),
      child: Column(
        children: List.generate(
            data.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(data[index]['label'],
                              style: (type == 'payment' &&
                                      index == data.length - 1)
                                  ? const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(fontSize: 14.0))),
                      Expanded(
                          flex: 1,
                          child: Text(
                            type == 'payment'
                                ? AppExtension.moneyFormat(
                                    data[index]['text'].toString())
                                : data[index]['text'],
                            textAlign: TextAlign.end,
                            style:
                                (type == 'payment' && index == data.length - 1)
                                    ? const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blueClr)
                                    : const TextStyle(
                                        height: 1.5,
                                        fontSize: 14.0,
                                        color: AppColors.darkClr),
                          )),
                    ],
                  ),
                )),
      ),
    );
  }
}
