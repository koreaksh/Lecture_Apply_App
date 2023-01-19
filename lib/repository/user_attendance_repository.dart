import 'dart:convert';

import 'package:http/http.dart' as http;

import '../consttants.dart';

class UserAttendanceRepository {
  Future<Map<String, dynamic>> loadAttendance(String userIndex, String lectureIndex, String lectureDetailIndex) async {
    var url = Uri.http(hostAddress, "Lecture/GetApplicationManagement");
    var response = await http.post(url, body: {"memUserIdx" : userIndex, "lciIdx" : lectureIndex, "lcdIdx" : lectureDetailIndex});
    var responseBody = utf8.decode(response.bodyBytes);
    return  jsonDecode(responseBody);
  }
}