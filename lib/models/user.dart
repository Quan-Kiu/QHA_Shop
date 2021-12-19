class User {
  final String imagePath;
  final String name;
  final String sex;
  final String dateOB;
  final String email;
  final String phone;
  final String password;

  const User(
      {required this.imagePath,
      required this.sex,
      required this.name,
      required this.dateOB,
      required this.email,
      required this.phone,
      required this.password});
}

class iicon {
  final String icon;
  final String link;

  iicon(this.icon, this.link);
}