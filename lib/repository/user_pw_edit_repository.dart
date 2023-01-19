import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class UserPwEditRepository {
  Future<Map> loadUserPwEdit(String userIndex, String currentPw, String changePw) async {
    var url = Uri.http(hostAddress, "User/UpdatePassword");
    var response = await http.post(url, body: {"memIdx" : userIndex, "memNowPasswd" : currentPw, "memNewPasswd" : changePw});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result;
  }
}