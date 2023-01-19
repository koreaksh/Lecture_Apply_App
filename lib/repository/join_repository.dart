import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:http/http.dart' as http;

class JoinRepository {
  Future<Map> loadJoinCheck({
    required String id,
    required String pw,
    required String name,
    required String phoneNum,
    required String email,
    required String address,
    required String addressDetail,
    required String memType,
  }) async {
    var url = Uri.http(hostAddress, "User/JoinUser");
    var response = await http.post(url, body: {
      "memId": id,
      "memPasswd": pw,
      "memEmail": email,
      "memPhone": phoneNum,
      "memNM": name,
      "memAddress": address,
      "memAddressDetail": addressDetail,
      "memLevelNM" : memType,
    });
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result;
  }
}
