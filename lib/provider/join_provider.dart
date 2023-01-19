import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/join_repository.dart';
import 'package:shinhanapp/screen/login_screen.dart';

class JoinProvider extends ChangeNotifier {
  final JoinRepository _joinRepository = JoinRepository();

  bool _joinSuccessCheck = false;

  bool get joinSuccessCheck => _joinSuccessCheck;

  String _message = "";

  String get message => _message;

  Future<void> join(
      {required String id,
      required String pw,
      required String name,
      required String phoneNum,
      required String email,
      required String address,
      required String addressDetail,
      required String memType}) async {
    _joinSuccessCheck = false;
    Map result = await _joinRepository.loadJoinCheck(
        id: id,
        pw: pw,
        name: name,
        phoneNum: phoneNum,
        email: email,
        address: address,
        addressDetail: addressDetail,
        memType: memType);
    if (result["status"] == "200") {
      _joinSuccessCheck = true;
    } else {
      _joinSuccessCheck = false;
      _message = result["msg"];
    }
  }
}
