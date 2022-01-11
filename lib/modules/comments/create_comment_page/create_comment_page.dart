import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/modules/comments/create_comment_page/components/body.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

class CreateCommentPage extends StatelessWidget {
  final product;
  const CreateCommentPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Viết đánh giá', {
        "route": RoutesName.COMMENT_PAGE,
        "arguments": {"product": product, "rating": null}
      }),
      body: Body(product: product),
    );
  }
}
