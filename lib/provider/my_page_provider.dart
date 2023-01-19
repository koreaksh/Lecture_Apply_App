import 'package:flutter/material.dart';
import 'package:shinhanapp/model/my_page_model.dart';
import 'package:shinhanapp/repository/my_page_repository.dart';

import '../model/lecture_list_model.dart';

class MyPageProvider extends ChangeNotifier {
  final MyPageRepository _myPageRepository = MyPageRepository();



  List<MyPageModel>? _myPageApplyList;
  List<MyPageModel>? _myPageStudyingList;
  List<MyPageModel>? _myPageCompleteList;

  List<LectureListModel>? _teacherMyPageApplyList;
  List<LectureListModel>? _teacherMyPageStudyingList;
  List<LectureListModel>? _teacherMyPageCompleteList;

  String _applyCount = "0";
  String get applyCount => _applyCount;

  String _studyIngCount = "0";
  String get studyIngCount => _studyIngCount;

  String _completeCount = "0";
  String get completeCount => _completeCount;

  // "0" == 수강신청  "1" == 수강중  "2" == 수강완료
  String _choiceIndex = "0";
  String get choiceIndex => _choiceIndex;


  List<MyPageModel>? getModelList() {
    if(_choiceIndex == "0") return _myPageApplyList;
    if(_choiceIndex == "1") return _myPageStudyingList;
    if(_choiceIndex == "2") return _myPageCompleteList;
    return null;
  }

  List<LectureListModel>? getTeacherModelList() {
    if(_choiceIndex == "0") return _teacherMyPageApplyList;
    if(_choiceIndex == "1") return _teacherMyPageStudyingList;
    if(_choiceIndex == "2") return _teacherMyPageCompleteList;
    return null;
  }

  String getTeacherCount() {
    if(_choiceIndex == "0") return _applyCount;
    if(_choiceIndex == "1") return _studyIngCount;
    return _completeCount;
  }

  void reFlesh() {
    notifyListeners();
  }

  //수강신청 수강중 수강완료중에 뭐눌렀는지 설정
  void setCoiceIndex(String index) {
    _choiceIndex = index;
  }

  //수강신청 수강중 수강완료중에 뭐눌렀는지에따라서 제목 던져줌
  String getTitle() {
    if(_choiceIndex == "0") return "수강신청 현황";
    if(_choiceIndex == "1") return "수강중 현황";
    if(_choiceIndex == "2") return "수강완료 현황";
    return "에러페이지";
  }

  void loadMyPage(String index) async {
    _applyCount = "0";
    _studyIngCount = "0";
    _completeCount = "0";
    _myPageApplyList = null;
    _myPageStudyingList = null;
    _myPageCompleteList = null;
    List<dynamic> resultList = await _myPageRepository.loadMyPageSmall(index);
    _applyCount = resultList[0];
    _myPageApplyList = resultList[1];
    _studyIngCount = resultList[2];
    _myPageStudyingList = resultList[3];
    _completeCount = resultList[4];
    _myPageCompleteList = resultList[5];
    notifyListeners();
  }

  void teacherLoadMyPage(String index) async {
    _applyCount = "0";
    _studyIngCount = "0";
    _completeCount = "0";
    _teacherMyPageApplyList = null;
    _teacherMyPageStudyingList = null;
    _teacherMyPageCompleteList = null;
    List<dynamic> resultList = await _myPageRepository.loadTeacherMyPageSmall(index);
    _applyCount = resultList[0];
    _teacherMyPageApplyList = resultList[1];
    _studyIngCount = resultList[2];
    _teacherMyPageStudyingList = resultList[3];
    _completeCount = resultList[4];
    _teacherMyPageCompleteList = resultList[5];
    notifyListeners();
  }


  String loadDate(int index) {
    String state = getModelList()![index].getLectureState();
    if(state == "수강완료") return getModelList()![index].getEndDate();
    if(state == "수강중") return getModelList()![index].getNextDate();
    return getModelList()![index].getStartDate();
  }

  String loadLocation(int index) {
    String address = getModelList()![index].getAddress();
    String addressDetail = getModelList()![index].getAddressDetail();
    return "$address\n$addressDetail";
  }

  Color loadColor(int index) {
    String state = getModelList()![index].getLectureState();
    if(state == "수강예정") return Color(0xffFF9100);
    if(state == "수강중") return Color(0xff37B700);
    if(state == "수강완료") return Color(0xffC1C1C1);
    return Color(0xffebcf34);
  }
}