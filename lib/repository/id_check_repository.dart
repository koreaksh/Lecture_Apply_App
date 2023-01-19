import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:http/http.dart' as http;
import 'package:shinhanapp/model/id_check_model.dart';

class IdCheckRepository {
  Future<IdCheckModel> loadIdCheck(String? id) async {
    var url = Uri.http(hostAddress, "User/AuthUser");
    var response = await http.post(url, body: {"memId" : id});

    var responseBody = utf8.decode(response.bodyBytes);

    Map<String, dynamic> result =  jsonDecode(responseBody);

    return IdCheckModel.fromJson(result);
  }
}