import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kpostal/kpostal.dart';
import 'package:shinhanapp/model/lecture_apply_model.dart';
import 'package:shinhanapp/repository/lecture_apply_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';

class LectureApplyProvider extends ChangeNotifier {
  LectureApplyRepository _lectureApplyRepository = LectureApplyRepository();

  String _status = "";
  LectureApplyModel? _lectureApplyModel;
  LectureApplyModel? get lectureApplyModel => _lectureApplyModel;
  String _address = "장소를 검색해 주세요.";
  String _addressDetail = "";
  String get address => _address;

  String _failMg = "";

  Future<void> loadLectureApply(
      String userIndex, String lectureIndex, String lectureDetailIndex) async {
    _failMg = "";
    _status = "";
    _lectureApplyModel = null;
    List<dynamic> resultList = await _lectureApplyRepository.loadLectureApply(
        userIndex, lectureIndex, lectureDetailIndex, _address, _addressDetail);
    if (resultList[0] != "200") {
      _status = resultList[0];
      _failMg = resultList[1];
    } else {
      _status = resultList[0];
      _lectureApplyModel = resultList[1];
    }
  }

  bool checkSuccess() {
    if(_status == "200") {
      return true;
    } else {
      showToast(_failMg, ToastGravity.CENTER);
      return false;
    }
  }

  void clear() {
    _address = "장소를 검색해 주세요.";
    _addressDetail = "";
  }

  Color getAddressColor() {
    Color color = _address == "장소를 검색해 주세요." ? Color(0xffC1C1C1) : Colors.black;
    return color;
  }

  void loadAddressFindScreen(BuildContext context) async {
    Kpostal result = await Navigator.push(context, MaterialPageRoute(builder: (_) => KpostalView()));
    _address = result.address;
    notifyListeners();
  }

  void setAddressDetail(String text) {
    _addressDetail = text;
  }

  bool checkField() {
    return _address != "장소를 검색해 주세요." && _addressDetail != "" ? true : false;
  }
}
