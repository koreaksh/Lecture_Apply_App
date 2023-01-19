import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/user_pw_check_repository.dart';


//회원정보수정전에 비밀번호 확인
class UserEditPwCheckProvider extends ChangeNotifier {
  UserPwCheckRepository _userPwCheckRepository = UserPwCheckRepository();
  String _pw = "";

  String get pw => _pw;

  bool _pwCheck = false;
  bool get pwCheck => _pwCheck;

  bool _tryCheck = false;
  bool get tryCheck => _tryCheck;

  void setPw(String pw) {
    _pw = pw;
  }

  Future<void> userPwCheck(String userIndex) async {
    _pwCheck = await _userPwCheckRepository.loadPwCheck(userIndex, _pw);
    _tryCheck = true;
  }

  void clear() {
    _pw = "";
    _pwCheck = false;
  }

  void tryClear() {
    _tryCheck = false;
  }
}