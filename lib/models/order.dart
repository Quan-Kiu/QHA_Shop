class Order {
  final String id;
  final String status;
  final double unitPrice;
  final int total;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.status,
    required this.unitPrice,
    required this.total,
    required this.createdAt,
  });
}
