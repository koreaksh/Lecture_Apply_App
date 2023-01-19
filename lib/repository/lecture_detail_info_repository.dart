import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/model/lecture_detail_info_model.dart';
import 'package:http/http.dart' as http; 

class LectureDetailInfoRepository {
  Future<List<LectureDetailInfoModel>> loadLectureDetailInfo(int index) async {
    var url = Uri.http(hostAddress, "Lecture/GetLectureDetailList");
    var response = await http.post(url, body: {"lciIdx" : index.toString()});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    List<dynamic> list = result["data"];
    return list.map((item) => LectureDetailInfoModel.fromjson(item)).toList();
  }
}