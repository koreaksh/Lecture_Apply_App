import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class PwFindChangeRepository {
  Future<bool> changePw(String id, String pw, String email, String name) async {
    var url = Uri.http(hostAddress, "User/UpdatePassword2");
    var response = await http.post(url, body: {"memId" : id, "memPasswd" : pw, "memEmail" : email, "memNM" : name});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result["status"] == "200" ? true : false;
  }
}