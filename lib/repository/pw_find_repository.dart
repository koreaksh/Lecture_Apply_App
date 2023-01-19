import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:http/http.dart' as http;

class PwFindRepository {
  Future<bool> pwFind(String id, String name, String email) async {
    var url = Uri.http(hostAddress, "User/FindPw");
    var response = await http.post(url, body: {"memId" : id, "memEmail" : email, "memNM" : name});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result["status"] == "200" ? true : false;
  }
}