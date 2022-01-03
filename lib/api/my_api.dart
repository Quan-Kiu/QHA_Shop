import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyApi {
  final String _baseUrl = 'http://10.0.2.2:8000/api/';

  postData(data, url) async {
    var fullUrl = _baseUrl + url;
    final response = await http.post(Uri.parse(fullUrl),
        headers: await _setHeaders(), body: jsonEncode(data));
    return json.decode(response.body);
  }

  putData(data, url) async {
    var fullUrl = _baseUrl + url;

    final response = await http.put(Uri.parse(fullUrl),
        headers: await _setHeaders(), body: jsonEncode(data));
    return json.decode(response.body);
  }
}

_setHeaders() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('qhatoken');
  return {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
