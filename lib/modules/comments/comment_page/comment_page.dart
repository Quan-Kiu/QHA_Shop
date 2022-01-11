import 'package:doan/api/my_api.dart';
import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/constants/assets/app_assets_path.dart';
import 'package:doan/constants/themes/app_colors.dart';
import 'package:doan/models/comment.dart';
import 'package:doan/widget/AppBar/my_app_bar_sec.dart';
import 'package:doan/widget/comment_item_widget.dart';
import 'package:doan/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentPage extends StatefulWidget {
  final data;
  const CommentPage({Key? key, this.data}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late List _comments = [];
  bool _isLoading = false;

  // The function that fetches data from the API
  getComment(data) async {
    setState(() {
      _isLoading = true;
    });
    var id = data['product'].id;
    var query = data['rating'] != null ? 'rating=${data['rating']}' : '';
    var url = 'comment/getCommentByProduct/$id?$query';
    var res = await MyApi().getData(url);
    if (res['success'] != null && res['success']) {
      List _comment =
          res['data'].map((item) => Comment.fromJson(item)).toList();
      setState(() {
        _comments = List.from(_comment.reversed);
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
    getComment(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSecondaryAppBar(context, 'Đánh giá', {
        "route": RoutesName.PRODUCT_DETAIL_PAGE,
        "arguments": widget.data['product']
      }),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        height: 45.0,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              6,
                              (index) => GestureDetector(
                                onTap: () => {
                                  Navigator.pushNamed(
                                      context, RoutesName.COMMENT_PAGE,
                                      arguments: {
                                        "product": widget.data['product'],
                                        "rating": index == 0 ? null : index
                                      })
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15.0),
                                  decoration: BoxDecoration(
                                      color: index == widget.data['rating'] ||
                                              (index == 0 &&
                                                  widget.data['rating'] == null)
                                          ? AppColors.lightClr
                                          : AppColors.whiteClr,
                                      border: Border.all(
                                          color: AppColors.lightClr)),
                                  constraints:
                                      const BoxConstraints(minWidth: 70.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      index == 0
                                          ? const Text('')
                                          : SvgPicture.asset(
                                              AppAssetsPath.starIcon,
                                              color: AppColors.yellowClr,
                                            ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: index == 0
                                            ? Text(
                                                index == 0
                                                    ? 'Tất cả đánh giá'
                                                    : index.toString(),
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColors.blueClr,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : Text(
                                                index.toString(),
                                                style: const TextStyle(
                                                    fontSize: 14.0),
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ),
                      _isLoading
                          ? Container(
                              alignment: Alignment.center,
                              height: 300.0,
                              child: const SizedBox(
                                  child: CircularProgressIndicator()),
                            )
                          : _comments.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                      _comments.length,
                                      (index) => CommentItem(
                                          comment: _comments[index])))
                              : const Text(
                                  'Hãy là người đầu tiên đánh giá sản phẩm này.')
                    ],
                  ),
                ),
              ),
              MyButtonWidget(
                  padding: EdgeInsets.zero,
                  text: 'Viết đánh giá',
                  onPress: () {
                    Navigator.pushNamed(context, RoutesName.CREATE_COMMENT_PAGE,
                        arguments: widget.data['product']);
                  },
                  color: AppColors.blueClr,
                  textStyle: const TextStyle(color: AppColors.whiteClr))
            ],
          )),
    );
  }
}
