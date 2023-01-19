import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/lecture_list_repository.dart';
import 'package:shinhanapp/repository/lecture_search_repository.dart';

import '../model/lecture_list_model.dart';

class LectureListProvider extends ChangeNotifier {
  final LectureListRepository _lectureListRepository = LectureListRepository();
  final LectureSearchRepository _lectureSearchRepository = LectureSearchRepository();

  List<LectureListModel> _lectureList = [];
  List<LectureListModel>? get lectureList => _lectureList;

  late List<LectureListModel> _list;

  String _text = "";
  String get text => _text;

  bool _check = false;
  bool _searchCheck = false;

  Future<void> loadLectureList() async {
    _lectureList = [];
    _list = await _lectureListRepository.loadLectureList();

    if(_list.isNotEmpty) {
      _lectureList = _list;
      notifyListeners();
    }
  }


  void search() async {
    if(!_check) return;
    if(_searchCheck) return;

    _searchCheck = true;
    _lectureList = [];
    notifyListeners();
    _list = await _lectureSearchRepository.loadLectureSearch(_text);
    _lectureList = _list;
    notifyListeners();
  }

  void setText(String text) {
    _text = text;
    _searchCheck = false;
    text != "" ? _check = true : _check = false;
    if(_text == "") {
      loadLectureList();
    }
  }
}