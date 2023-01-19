import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

import '../model/lecture_list_model.dart';
class LectureSearchRepository {
  Future<List<LectureListModel>> loadLectureSearch(String searchText) async {
    var url = Uri.http(hostAddress, "Lecture/SearchLectureList");
    var response = await http.post(url, body: {"search" : searchText});
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String,dynamic> result = jsonDecode(responseBody);
    List<dynamic> list = result["data"];
    List<LectureListModel> searchList = list.map((e) => LectureListModel.fromJson(e)).toList();
    return searchList;
  }
}