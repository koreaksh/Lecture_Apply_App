import 'package:flutter/material.dart';
import 'package:shinhanapp/model/login_model.dart';
import 'package:shinhanapp/repository/auto_login_repository.dart';
import 'package:shinhanapp/repository/login_repository.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository _loginRepository = LoginRepository();
  final AutoLoginRepository _autoLoginRepository = AutoLoginRepository();
  String _id = "";
  String _pw = "";
  String _resultStatus = "";
  String get resultStatus => _resultStatus;
  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;

  void setId(String id) {
    _id = id;
  }

  void setPw(String pw) {
    _pw = pw;
  }

  bool checkIdPw() {
    return _id == "" || _pw == "" ? false : true;
  }

  Future<void> userLogin(String memType) async {
    List<dynamic> resultList = await _loginRepository.login(_id, _pw, memType);
    if(resultList[0] == "200") {
      _resultStatus = resultList[0];
      _loginModel = resultList[1];
    } else {
      _resultStatus = resultList[0];
    }
  }

  Future<void> userAutoLogin(String userIndex) async {
    List<dynamic> resultList = await _autoLoginRepository.loadAutoLogin(userIndex);
    if(resultList[0] == "200") {
      _resultStatus = resultList[0];
      _loginModel = resultList[1];
    } else {
      _resultStatus = resultList[0];
    }
  }

  void userLogout() {
    _id = "";
    _pw = "";
    _resultStatus = "";
    _loginModel = null;
  }

  void changeCall() {
    notifyListeners();
  }

  bool typeCheck() {
    if(_loginModel == null) return true;
    return _loginModel!.getMemType() == "일반회원" ? true : false;
  }
}