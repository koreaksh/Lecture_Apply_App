import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class UserDeleteRepository {
  Future<bool> loadUserDelete(String userIndex, String pw, String reason) async {
    var url = Uri.http(hostAddress, "User/UpdateUser");
    var response = await http.post(url, body: {"memIdx" : userIndex, "memPasswd" : pw, "memIsLeft" : "1", "memLeftReason" : reason});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String,dynamic> result = jsonDecode(responseBody);
    bool successCheck = result["status"] == "200" ? true : false;
    return successCheck;
  }
}