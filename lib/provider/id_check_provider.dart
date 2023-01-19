import 'package:flutter/material.dart';
import 'package:shinhanapp/model/id_check_model.dart';
import 'package:shinhanapp/repository/id_check_repository.dart';

class IdCheckProvider extends ChangeNotifier {
  final IdCheckRepository _idCheckRepository = IdCheckRepository();

  IdCheckModel? _idCheck;
  IdCheckModel? get idCheck => _idCheck;

  //중복확인버튼을 눌렀는지
  //텍스트필드값이 바뀌면 바로 false로 바뀜
  //중복확인버튼을 눌러야 true로 바뀜
  bool _check = false;
  bool get check => _check;

  String _id = "";
  String get id => _id;


  void loadIdCheck(String id) async {
    IdCheckModel result = await _idCheckRepository.loadIdCheck(id);
    _idCheck = result;
    notifyListeners();
  }

  void trueCheck() {
    _check = true;
  }

  void falseCheck() {
    _check = false;
    notifyListeners();
  }
  //dispose에서사용
  void falseChecked(){
    _check = false;
  }

  void setId(String id) {
    _id = id;
  }

  void clearId() {
    _id = "";
  }

}