class AppExtension {
  static capitalize(String string) {
    return "${string[0].toUpperCase()}${string.substring(1)}";
  }

  static moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value + "đ";
    }
  }
}
