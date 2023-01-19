import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:http/http.dart' as http;

import '../model/login_model.dart';

class LoginRepository {
  Future<List<dynamic>> login(String id, String pw, String memType) async {
    var url = Uri.http(hostAddress, "User/Login");
    var response = await http.post(url, body: {"memId" : id, "memPasswd" : pw, "memLevelNM" : memType});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    if(result["status"] != "200" ) {
      return [result["status"]];
    }
    return [result["status"], LoginModel.fromJson(result["data"])];
  }
}