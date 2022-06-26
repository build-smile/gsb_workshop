import 'dart:convert';
import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:gsb_workshop/utils/LocalStorage.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class InventoryService {
  LocalStorage localStorage = LocalStorage();

  getAll() async {
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    if (token == null) {
      return null;
    }
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.body);
  }
}
