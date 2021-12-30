import 'package:doan/modules/comments/create_comment_page/components/body.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:flutter/material.dart';

class CreateCommentPage extends StatelessWidget {
  const CreateCommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Viết đánh giá'),
      body: const Body(),
    );
  }
}
