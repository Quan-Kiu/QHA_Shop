import 'package:doan/constants/pay.dart';

handlePriceOrder(myCart, discount) {
  var discount_price = 0;
  if (discount != null) {
    discount_price = discount.price;
  }
  var amount = 0;
  myCart.forEach((element) {
    amount += (element.quantity * element.product.discount) as int;
  });
  var tax = (amount * Pay().taxPercent).round();
  var shippingPrice = myCart.length * (amount * Pay().shippingPercent).round();
  var unitPrice = amount + shippingPrice + tax - discount_price;
  unitPrice = unitPrice < 0 ? 0 : unitPrice;
  final _cartInfos = [
    {'label': 'Số lượng (${myCart.length})', 'text': amount},
    {'label': 'Phí vận chuyển', 'text': shippingPrice},
    {'label': 'Thuể', 'text': tax},
    {'label': 'Giảm giá', 'text': discount_price},
    {'label': 'Tổng tiền', 'text': unitPrice},
  ];

  return {
    'amount': amount,
    'shippingPrice': shippingPrice,
    'tax': tax,
    "unitPrice": unitPrice,
    "cartInfos": _cartInfos,
  };
}
