import 'package:doan/config/routes/routes_name.dart';

class TypeCheckout {
  final String icon, name, router;
  final int id;

  TypeCheckout({
    required this.id,
    required this.icon,
    required this.name,
    required this.router,
  });
}

List<TypeCheckout> type = [
  TypeCheckout(
    id: 1,
    name: "Thẻ tín dụng hoặc thẻ ghi nợ",
    icon: "Bank.svg",
    router: RoutesName.PAYMENTCARD_PAGE,
  ),
  TypeCheckout(
    id: 2,
    name: "Ngân hàng nội địa",
    icon: "Group.svg",
    router: '',
  ),
];
