import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class IdFindRepository {
  Future<List<String>> idFind(String name, String email) async {
    var url = Uri.http(hostAddress, "User/FindId");
    var response = await http.post(url, body: {"memNM" : name, "memEmail" : email});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    //성공하면 status 와 아이디를 반환 / 실패시 status 만 반환 / 에러시 빈리스트 반환
    if(result["status"] == "200") {
      return [result["status"], result["LecId"]];
    } else if (result["status"] == "500") {
      return [result["status"]];
    } else {
      return [];
    }
  }
}