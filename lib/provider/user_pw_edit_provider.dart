import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/user_pw_edit_repository.dart';

class UserPwEditProvider extends ChangeNotifier {
  String _currentPw = "";
  String _changePw = "";
  String _reChangePw = "";

  UserPwEditRepository _userPwEditRepository = UserPwEditRepository();

  void setCurrentPw(String pw) {
    _currentPw = pw;
  }

  void setChangePw(String pw) {
    _changePw = pw;
  }

  void setReChangePw(String pw) {
    _reChangePw = pw;
  }

  List<dynamic> checkPw() {
    if (_currentPw == "" || _changePw == "" || _reChangePw == "") {
      return [false, "비밀번호를 입력해 주세요."];
    } else if (_changePw != _reChangePw) {
      return [false, "변경할 비밀번호가 일치하지 않습니다."];
    }
    return [true];
  }

  Future<List> changePw(String userIndex) async {
    if(_changePw != _reChangePw) return [false, "변경할 비밀번호가 일치하지 않습니다."];
    Map result = await _userPwEditRepository.loadUserPwEdit(userIndex, _currentPw, _changePw);
    if(result["status"] == "200") {
      return [true];
    }
    return [false, result["msg"]];
  }

  void clear() {
    _changePw = "";
    _currentPw = "";
    _reChangePw = "";
  }
}
