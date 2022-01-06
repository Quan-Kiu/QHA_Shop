import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/body.dart';

class ProductDetail extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, widget.product),
      body: Body(product: widget.product),
    );
  }
}
