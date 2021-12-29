class Notify {
  final String title;
  final String description;
  final String media;
  final String link;
  final DateTime createdAt;

  Notify(this.title, this.description, this.media, this.link, this.createdAt);
}

Notify postNotifyItem = Notify(
    'Sản phẩm mới',
    'Nike Air Zoom Pegasus 36 Miami - Đặc biệt cho hoạt động của bạn',
    'https://anv.vn/wp-content/uploads/2020/09/giay-dior-H4.jpg',
    '',
    DateTime.now());
Notify activityNotifyItem = Notify(
    'Giao dịch sản phẩm Nike Air Zoom',
    'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
    '',
    '',
    DateTime.now());
