import 'dart:convert';

import 'package:http/http.dart' as http;

import '../consttants.dart';

class UserPhoneEditRepository {
  Future<Map> loadUserPhoneEdit(String userIndex, String phoneNum) async {
    var url = Uri.http(hostAddress, "User/UpdateUser");
    var response = await http.post(url, body: {"memIdx" : userIndex, "memPhone" : phoneNum});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result;
  }
}