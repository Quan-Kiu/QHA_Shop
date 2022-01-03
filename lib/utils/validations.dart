class Validations {
  static email(String string, Function cb) {
    if (string == '' || string.trim().length == 0) {
      return throw Exception(cb('Trường email không được để trống.'));
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(string)) {
      return throw Exception(cb('Trường email không hợp lệ.'));
    }

    cb('');
    return true;
  }

  static password(String string, Function cb) {
    if (string == '' || string.trim().length == 0) {
      return throw Exception(cb('Trường password không được để trống.'));
    }
    if (string.length < 6) {
      return throw Exception(cb('Trường mật khẩu ít nhât 6 ký tự.'));
    }

    cb('');
    return true;
  }

  static confirmPassword(String string, String password, Function cb) {
    if (string != password) {
      return throw Exception(cb('Mật khẩu không trùng khớp.'));
    }
    cb('');
    return true;
  }

  static fullname(String string, Function cb) {
    if (string == '' || string.trim().length == 0) {
      return throw Exception(cb('Trường họ tên không được để trống.'));
    }
    if (string.length < 6) {
      return throw Exception(cb('Trường họ tên ít nhât 6 ký tự.'));
    }
    if (string.length > 35) {
      return throw Exception(cb('Trường họ tên nhiều nhât 35 ký tự.'));
    }

    cb('');
    return true;
  }

  static phonenumber(String string, Function cb) {
    if (RegExp(r"/(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/")
        .hasMatch(string)) {
      return throw Exception(cb('Số điện thoại không hợp lệ.'));
    }

    cb('');
    return true;
  }
}
