import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

import '../model/login_model.dart';

class AutoLoginRepository {
  Future<List<dynamic>> loadAutoLogin(String userIndex) async {
    var url = Uri.http(hostAddress, "User/GetUserInfoToIdx");
    var response = await http.post(url, body: {"memIdx" : userIndex});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String , dynamic> result = jsonDecode(responseBody);
    if(result["status"] != "200" ) {
      return [result["status"]];
    }
    return [result["status"], LoginModel.fromJson(result["data"])];
  }
}