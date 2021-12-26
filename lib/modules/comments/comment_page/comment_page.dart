import 'package:doan/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Đánh giá'),
      body: const Body(),
    );
  }
}
