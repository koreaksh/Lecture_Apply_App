import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class ApplyChangeRepository {
  Future<bool> applyChange(String userIndex, String lectureDetailIndex, String type) async {
    var url = Uri.http(hostAddress, "Request/UpdateRequest");
    var response = await http.post(url, body: {"contentDetailIdx" : lectureDetailIndex, "userIdx" : userIndex, "leqStatus" : type});
    print("userIndex : ${userIndex} //  lectureDetailIndex : ${lectureDetailIndex} // type ${type}");
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    return result["status"] == "200" ? true : false;
  }
}