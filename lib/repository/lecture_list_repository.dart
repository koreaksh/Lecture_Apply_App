import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/model/lecture_list_model.dart';

class LectureListRepository {
  Future<List<LectureListModel>>loadLectureList() async {
    var url = Uri.http(hostAddress, "Lecture/GetLectureList");
    var response = await http.post(url);
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    List<dynamic> list = result["data"];
    return list.map((item) => LectureListModel.fromJson(item)).toList();
  }
}