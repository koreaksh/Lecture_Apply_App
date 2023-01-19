import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

class UserAddressEditRepository {
  Future<Map> loadUserAddressEdit(String userIndex, String address, String addressDetail) async {
    var url = Uri.http(hostAddress, "User/UpdateUser");
    var response = await http.post(url, body: {"memIdx" : userIndex, "memAddress" : address, "memAddressDetail" : addressDetail});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String,dynamic> result = jsonDecode(responseBody);
    return result;
  }
}