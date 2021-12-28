import 'package:doan/models/transpost.dart';
import 'package:doan/widget/transpost_card.dart';
import 'package:flutter/material.dart';

class bodyTransPost extends StatelessWidget {
  const bodyTransPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemTrans.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              TransPost_Card(
                  City: itemTrans[index].City,
                  Address: itemTrans[index].Address,
                  Phone: itemTrans[index].PhoneNumber)
            ],
          );
        });
  }
}


