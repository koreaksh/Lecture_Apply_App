import 'package:flutter/material.dart';

class PwCheckProvider extends ChangeNotifier {
  //비밀번호입력
  String _pw = "";
  String get pw => _pw;

  //비밀번호다시입력
  String _pwCheck = "";

  //비밀번호입력창키
  final int _pwKey = 1;
  int get pwKey => _pwKey;

  //비밀번호다시입릭창키
  final int _pwCheckKey = 2;
  int get pwCheckKey => _pwCheckKey;

  String _pwText = "";
  String get pwText => _pwText;

  void setPw(String pw) {
    _pw = pw;
  }

  String getPw() {
    if(_pwCheck == "" || _pwCheck != _pw) {
      return "";
    }
    return _pw;
  }

  void setPwCheck(String pw) {
    _pwCheck = pw;
  }

  bool checkPw() {
    bool result = _pw == _pwCheck ? true : false;
    return result;
  }

  void checkText() {
    if(_pwCheck == "") {
      _pwText = "";
      return;
    }
    if(!checkPw()) {
      _pwText = "비밀번호가 일치하지 않습니다.";
    } else {
      _pwText = "비밀번호가 일치 합니다.";
    }
    notifyListeners();
  }

  void clearCheckText() {
    _pwText = "";
  }

  void clearPw() {
    _pw = "";
  }

  void clearPwCheck() {
    _pwCheck = "";
  }
}