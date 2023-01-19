import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/user_delete_repository.dart';

class UserDeleteProvider extends ChangeNotifier {
  UserDeleteRepository _userDeleteRepository = UserDeleteRepository();

  String _deleteReason = "원하는 강의가 없어요.";
  String _pw = "";
  bool _successCheck = false;
  bool get successCheck => _successCheck;

  void setDeleteReason(String reason) {
    _deleteReason = reason;
  }

  void setPw(String pw) {
    _pw = pw;
  }

  void clear() {
    _pw = "";
    _deleteReason = "원하는 강의가 없어요.";
  }

  Future<void> userDelete(String userIndex) async {
    _successCheck = await _userDeleteRepository.loadUserDelete(userIndex, _pw, _deleteReason);
  }

  bool pwCheck() {
    bool check = _pw == "" ? true : false;
    return check;
  }
}
