import 'package:flutter/material.dart';
import 'package:shinhanapp/model/lecture_latest_model.dart';
import 'package:shinhanapp/model/main_lecture_apply_model.dart';
import 'package:shinhanapp/model/main_lecture_model.dart';
import 'package:shinhanapp/repository/main_repository.dart';

class MainProvider extends ChangeNotifier {
  MainRepository _mainRepository = MainRepository();

  MainLectureApplyModel? _mainLectureApplyModel;
  MainLectureApplyModel? get mainLectureApplyModel => _mainLectureApplyModel;

  MainLectureModel? _mainLectureModel;
  MainLectureModel? get mainLectureModel => _mainLectureModel;

  List<LectureLatestModel>? _lectureLatestModel;
  List<LectureLatestModel>? get lectureLatestModel => _lectureLatestModel;

  Future<void> loadMainData() async {
    _mainLectureApplyModel = null;
    _mainLectureModel = null;
    _lectureLatestModel = null;

    List<dynamic> result  = await _mainRepository.loadMainData();
    _mainLectureApplyModel = result[0];
    _mainLectureModel = result[1];
    _lectureLatestModel = result[2];

    notifyListeners();
  }
}