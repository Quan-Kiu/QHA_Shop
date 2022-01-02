import 'dart:convert';

import 'package:http/http.dart' as http;

class MyApi {
  final String _baseUrl = 'http://10.0.2.2:8000/api/';

  postData(data, url) async {
    var fullUrl = _baseUrl + url;
    final response = await http.post(Uri.parse(fullUrl),
        headers: _setHeaders(), body: jsonEncode(data));
    return json.decode(response.body);
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
