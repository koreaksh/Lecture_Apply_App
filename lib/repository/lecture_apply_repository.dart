import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shinhanapp/consttants.dart';

import '../model/lecture_apply_model.dart';

class LectureApplyRepository {
  Future<List<dynamic>> loadLectureApply(String userIndex, String lectureIndex,
      String lectureDetailIndex, String address, String addressDetail) async {
    var url = Uri.http(hostAddress, "Request/InsertRequest");
    var response = await http.post(url, body: {
      "leqUserIdx": userIndex,
      "leqContentIdx": lectureIndex,
      "leqContentDetailIdx": lectureDetailIndex,
      "leqAddress": address,
      "leqAddressDetail": addressDetail
    });
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);
    if (result["status"] != "200") return [result["status"], result["msg"]];
    return [result["status"], LectureApplyModel.fromJson(result["data"])];
  }
}
