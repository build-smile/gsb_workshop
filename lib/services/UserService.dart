import 'dart:convert';

import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class UserService {
  Future<HttpStatusMsg> register(String username, String password) async {
    Uri uri = Uri.parse('$HOST/user/');
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}));

    print(response.body);
    HttpStatusMsg htm = HttpStatusMsg();
    if (response.statusCode == 200) {
      htm.success = true;
      return htm;
    } else if (response.statusCode == 400) {
      htm.success = false;
      htm.errorMsg = 'User already registered';
      return htm;
    }
    htm.success = false;
    htm.errorMsg = 'Something went wrong';
    return htm;
  }

  Future<HttpStatusMsg> login(
      {required String username, required String password}) async {
    Uri uri = Uri.parse('$HOST/token');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'username': username, 'password': password},
    );
    HttpStatusMsg htm = HttpStatusMsg();
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      htm.success = true;
      htm.result = result['access_token'];
      return htm;
    }
    htm.success = false;
    htm.errorMsg = 'Invalid user';
    return htm;
  }
}
