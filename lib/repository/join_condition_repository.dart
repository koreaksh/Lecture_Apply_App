import 'dart:convert';

import 'package:http/http.dart' as http;

import '../consttants.dart';

class JoinConditionRepository {
  Future<String> loadCondition() async {
    var url = Uri.http(hostAddress, "Setting/GetAggrement");
    var response = await http.post(url);
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    if(result["status"] != "200") return "";
    return result["data"][0]["hpcVal_1"];
  }
}