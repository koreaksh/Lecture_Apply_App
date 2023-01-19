import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class UserPwCheckRepository {
  Future<bool> loadPwCheck(String userIndex, String pw) async {
    var url = Uri.http(hostAddress, "User/CheckPw");
    var response = await http.post(url, body: {"memIdx" : userIndex, "memPasswd" : pw});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    bool check = result["status"] == "200" ? true : false;
    return check;
  }
}