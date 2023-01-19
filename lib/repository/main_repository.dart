import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/model/lecture_latest_model.dart';
import 'package:shinhanapp/model/main_lecture_apply_model.dart';
import 'package:shinhanapp/model/main_lecture_model.dart';

class MainRepository {
  Future<List<dynamic>> loadMainData() async {
    var applyUrl = Uri.http(hostAddress, "Lecture/GetLectureStatusCount");
    var lectureUrl = Uri.http(hostAddress, "Request/GetRequestStatusCount");
    var latestLectureUrl = Uri.http(hostAddress, "Lecture/GetRecentLectureList");

    var applyResponse = await http.post(applyUrl);
    var lectureResponse = await http.post(lectureUrl);
    var latestLectureResponse = await http.post(latestLectureUrl);

    var applyResponseBody = utf8.decode(applyResponse.bodyBytes);
    var lectureResponseBody = utf8.decode(lectureResponse.bodyBytes);
    var latestLectureResponseBody = utf8.decode(latestLectureResponse.bodyBytes);

    Map<String, dynamic> applyResult = jsonDecode(applyResponseBody);
    Map<String, dynamic> lectureResult = jsonDecode(lectureResponseBody);
    Map<String, dynamic> latestLectureResult = jsonDecode(latestLectureResponseBody);

    MainLectureApplyModel applyModel = MainLectureApplyModel.fromJson(applyResult["data"]);
    MainLectureModel lectureModel = MainLectureModel.fromJson(lectureResult["data"]);

    List<dynamic> latestLectureList = latestLectureResult["data"];
    return [applyModel, lectureModel, latestLectureList.map((e) => LectureLatestModel.fromJson(e)).toList()];
  }
}