import 'dart:convert';
import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:gsb_workshop/models/Inventory.dart';
import 'package:gsb_workshop/utils/LocalStorage.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class InventoryService {
  LocalStorage localStorage = LocalStorage();

  Future<List<Inventory?>?> getAll() async {
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    if (token == null) {
      return null;
    }
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      List<Inventory> inv = result.map((i) => Inventory.fromJson(i)).toList();
      return inv;
    }
    return null;
  }

  Future<HttpStatusMsg> insert(Inventory inventory) async {
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    HttpStatusMsg htm = HttpStatusMsg();
    if (token == null) {
      htm.success = false;
      htm.errorMsg = "Token is null";
      return htm;
    }
    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          "description": inventory.description,
          "price": inventory.price,
          "stock": inventory.stock
        }));

    if (response.statusCode == 200) {
      htm.success = true;
      return htm;
    }
    htm.success = false;
    htm.errorMsg = "Something went wrong status code:${response.statusCode}";
    return htm;
  }
}
