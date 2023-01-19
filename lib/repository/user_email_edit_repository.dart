import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class UserEmailEditRepository {
  Future<Map> loadUserEmailEdit(String userIndex, String email) async {
    var url = Uri.http(hostAddress, "User/UpdateUser");
    var response = await http.post(url, body: {"memIdx" : userIndex, "memEmail" : email});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result;
  }
}