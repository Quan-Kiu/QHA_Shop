import 'package:doan/models/address.dart';
import 'package:doan/widget/transpost_card.dart';
import 'package:flutter/material.dart';

class bodyAddress extends StatelessWidget {
  const bodyAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemInfor.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              TransPost_Card(
                  City: itemInfor[index].City,
                  Address: itemInfor[index].Address,
                  Phone: itemInfor[index].PhoneNumber)
            ],
          );
        });
  }
}
