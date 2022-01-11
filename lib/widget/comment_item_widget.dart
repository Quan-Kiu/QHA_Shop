import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/constants/themes/app_text_styles.dart';
import 'package:doan/models/comment.dart';
import 'package:doan/widget/rating_widget.dart';
import 'package:flutter/material.dart';

import 'mytext_widget.dart';

class CommentItem extends StatelessWidget {
  final comment;
  const CommentItem({Key? key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            ClipOval(
              child: Image.network(
                comment.user.avatar,
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MyTextWidget(
                text: comment.user.fullname,
                isBold: true,
                color: AppColors.darkClr,
                fontSize: 14,
              ),
              Rating(
                star_count: comment.rating,
              )
            ])
          ]),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.content,
                  style: AppTextStyles.largeText,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  comment.createdAt.substring(0, 10),
                  style: AppTextStyles.mediumText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
