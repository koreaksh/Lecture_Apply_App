import 'package:flutter/material.dart';
import 'package:shinhanapp/model/lecture_info_model.dart';
import 'package:shinhanapp/repository/lecture_detail_info_repository.dart';
import 'package:shinhanapp/repository/lecture_info_repository.dart';

import '../model/lecture_detail_info_model.dart';

class LectureInfoProvider extends ChangeNotifier {
  LectureInfoRepository _lectureInfoRepository = LectureInfoRepository();
  LectureDetailInfoRepository _lectureDetailInfoRepository = LectureDetailInfoRepository();

  LectureInfoModel? _lectureInfo;
  LectureInfoModel? get lectureInfo => _lectureInfo;

  List<LectureDetailInfoModel>? _lectureDetailInfo;
  List<LectureDetailInfoModel>? get lectureDetailInfo => _lectureDetailInfo;

  List textList = [];

  void loadLectureInfo(int index) async {
    clear();
    _lectureInfo = await _lectureInfoRepository.loadLectureInfo(index);
    _lectureDetailInfo = await _lectureDetailInfoRepository.loadLectureDetailInfo(index);
    if(_lectureInfo != null && _lectureDetailInfo != null) {
      for(int i = 0; i < _lectureDetailInfo!.length; i++) {
        LectureDetailInfoModel data = _lectureDetailInfo![i];
        textList.add("${data.getLectureStartDate()} ~ ${data.getLectureEndDate()}\n${data.getWeek()} (${data.getLectureStartTime()} ~ ${data.getLectureEndTime()})");
      }
      textList.insert(0, "강의 날짜를 선택해 주세요.");
      notifyListeners();
    }
  }

  void clear() {
    textList = [];
    _lectureDetailInfo = null;
    _lectureInfo = null;
  }
}