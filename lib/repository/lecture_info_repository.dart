import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/model/lecture_info_model.dart';
import 'package:http/http.dart' as http;

class LectureInfoRepository {
  Future<LectureInfoModel> loadLectureInfo(int index) async {
    var url = Uri.http(hostAddress, "Lecture/GetLectureInfo");
    var response = await http.post(url, body: {"lciIdx" : index.toString()});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String ,dynamic> result = jsonDecode(responseBody);
    return LectureInfoModel.fromJson(result["data"]);
  }
}