import 'dart:convert';

import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/model/my_page_model.dart';
import 'package:http/http.dart' as http;

import '../model/lecture_list_model.dart';

class MyPageRepository {
  Future<List<dynamic>> loadMyPageSmall(String userIndex) async {
    var url = Uri.http(hostAddress, "Lecture/GetLectureUserList");
    var response = await http.post(url, body: {"leqUserIdx": userIndex});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);

    List<dynamic> applyList = result["pretend_list"];
    List<dynamic> studyingList = result["processing_list"];
    List<dynamic> completeList = result["complete_list"];

    String applyListCount = result["pretend_count"].toString();
    String studyingListCount = result["processing_count"].toString();
    String completeListCount = result["complete_count"].toString();

    return [
      applyListCount,
      applyList.map((item) => MyPageModel.fromJson(item)).toList(),
      studyingListCount,
      studyingList.map((item) => MyPageModel.fromJson(item)).toList(),
      completeListCount,
      completeList.map((item) => MyPageModel.fromJson(item)).toList()
    ];
  }

  Future<List<dynamic>> loadTeacherMyPageSmall(String userIndex) async {
    var url = Uri.http(hostAddress, "Lecture/GetLectureTeacherList");
    var response = await http.post(url, body: {"leqUserIdx": userIndex});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);

    List<dynamic> applyList = result["pretend_list"];
    List<dynamic> studyingList = result["processing_list"];
    List<dynamic> completeList = result["complete_list"];

    String applyListCount = result["pretend_count"].toString();
    String studyingListCount = result["processing_count"].toString();
    String completeListCount = result["complete_count"].toString();

    return [
      applyListCount,
      applyList.map((item) => LectureListModel.fromJson(item)).toList(),
      studyingListCount,
      studyingList.map((item) => LectureListModel.fromJson(item)).toList(),
      completeListCount,
      completeList.map((item) => LectureListModel.fromJson(item)).toList()
    ];
  }
}
