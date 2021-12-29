import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/modules/transpost_page/component/bodyTransPost.dart';
import 'package:doan/widget/my_app_bar.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TransPost());
}

class TransPost extends StatelessWidget {
  const TransPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Vận chuyển đến'),
      body: bodyTranspost(),
      bottomNavigationBar: Container(
        child: MyButtonWidget(
            text: 'Tiếp tục',
            onPress: () => Navigator.pop(context),
            color: AppColors.blueClr,
            textStyle:
                const TextStyle(color: AppColors.whiteClr, fontSize: 16.0),
            padding: const EdgeInsets.all(10.0)),
      ),
    );
  }
}
