import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/id_find_repository.dart';
import 'package:shinhanapp/repository/pw_find_change_repository.dart';
import 'package:shinhanapp/repository/pw_find_repository.dart';

class IdPwFindProvider extends ChangeNotifier {
  //true 아이디찾기 선택 / false 비밀번호찾기 선택
  bool _idPwChoice = true;
  bool get idPwChoice => _idPwChoice;

  //아이디 비밀번호 찾기시 textField 에 입력하는 값들.
  String _id = "";
  String _email = "";
  String _name = "";

  //아이디찾기 서버통신
  final IdFindRepository _idFindRepository = IdFindRepository();

  //비밀번호찾기 서버통신
  final PwFindRepository _pwFindRepository = PwFindRepository();

  //비밀번호변경 서버통신
  final PwFindChangeRepository _pwFindChangeRepository = PwFindChangeRepository();

  //실패시 메세지
  String _failMg = "";
  String get failMg => _failMg;

  //아이디 찾기 성공시 보여줄 아이디
  String _findSuccessId = "";
  String get findSuccessId => _findSuccessId;


  //비밀번호찾기성공후 변경할 비밀번호
  String _pw = "";
  String _rePw = "";


  void idChoice() {
    if(_idPwChoice == true) return;
    dataClear();
    _idPwChoice = true;
    notifyListeners();
  }

  void pwChoice() {
    if(_idPwChoice == false) return;
    dataClear();
    _idPwChoice = false;
    notifyListeners();
  }

  void clear() {
    _idPwChoice = true;
    _id = "";
    _name ="";
    _email = "";
  }

  void dataClear() {
    _id = "";
    _name = "";
    _email = "";
  }

  void setId(String id) {
    _id = id;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setName(String name) {
    _name = name;
  }

  //아이디 / 비밀번호 찾기 서버통신 시작
  Future<bool> find() async {
    if(_idPwChoice) {
      List<dynamic> resultList = await _idFindRepository.idFind(_name, _email);

      if(resultList.isEmpty) {
        _failMg = "잠시 후 다시 시도해 주세요.";
        return false;
      }

      if(resultList[0] == "200") {
        _findSuccessId = resultList[1];
        return true;
      } else {
        _failMg = "해당 정보로 등록된 계정이 없습니다.";
        return false;
      }
    } else {
      bool result = await _pwFindRepository.pwFind(_id, _name, _email);
      if(!result) {
        _failMg = "해당 정보로 등록된 계정이 없습니다.";
        return result;
      }
      return result;
    }
  }

  //textField 가 모두 채워져있는지 판단
  bool textFieldCheck() {
    if(_idPwChoice) {
      return _name == "" || _email == "" ? false : true;
    }
    return _name == "" || _email == "" || _id == "" ? false : true;
  }

  void setPw(String pw) {
    _pw = pw;
  }

  void setRePw(String pw) {
    _rePw = pw;
  }

  void pwClear() {
    _pw = "";
    _rePw = "";
  }

  List<dynamic> checkPw() {
    if(_pw == "" || _rePw == "") {
      return [false, "비밀번호를 입력해 주세요."];
    } else if(!(_pw == _rePw)) {
      return [false, "비밀번호가 동일하지 않습니다."];
    } else {
      return [true];
    }
  }

  Future<bool> changePw() async {
    return await _pwFindChangeRepository.changePw(_id, _pw, _email, _name);
  }
}