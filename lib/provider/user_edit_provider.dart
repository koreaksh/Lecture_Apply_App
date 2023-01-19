import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kpostal/kpostal.dart';
import 'package:shinhanapp/repository/user_address_edit_repository.dart';
import 'package:shinhanapp/repository/user_email_edit_repository.dart';
import 'package:shinhanapp/repository/user_phone_edit_repository.dart';

class UserEditProvider extends ChangeNotifier {
  final UserPhoneEditRepository _userPhoneEditRepository = UserPhoneEditRepository();
  final UserEmailEditRepository _userEmailEditRepository = UserEmailEditRepository();
  final UserAddressEditRepository _userAddressEditRepository = UserAddressEditRepository();

  String _userPhoneNumber = "";
  String _userEmail = "";
  String _userAddress = "";
  String _userAddressDetail = "";
  String _postMessage = "";
  bool _userDataEditCheck = false;


  String get postMessage => _postMessage;

  String get userPhoneNumber => _userPhoneNumber;

  String get userEmail => _userEmail;

  String get userAddress => _userAddress;

  String get userAddressDetail => _userAddressDetail;

  bool get userDataEditCheck => _userDataEditCheck;


  void setUserPhoneNumber(String phoneNumber) {
    _userPhoneNumber = phoneNumber;
  }

  void setUserEmail(String email) {
    _userEmail = email;
  }

  void setUserAddress(String address) {
    _userAddress = address;
  }

  void setUserAddressDetail(String detail) {
    _userAddressDetail = detail;
  }

  loadAddressFindScreen(BuildContext context) async {
    Kpostal result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => KpostalView()));
    _userAddress = result.address;
  }

  void clearData() {
    _userAddress = "";
    _userAddressDetail = "";
    _userEmail = "";
    _userPhoneNumber = "";
    _postMessage = "";
  }

  bool checkUserPhoneNum(String userPhoneNum) {
    bool check = _userPhoneNumber == "" || _userPhoneNumber == userPhoneNum
        ? false
        : true;
    return check;
  }

  Future<bool> loadUserPhoneEdit(String userIndex) async {
    Map result = await _userPhoneEditRepository.loadUserPhoneEdit(
        userIndex, _userPhoneNumber);
    if (result["status"] == "200") {
      return true;
    }
    _postMessage = result["msg"];
    return false;
  }

  bool checkUserEmail(String userEmail) {
    bool check = _userEmail == "" || _userEmail == userEmail ? false : true;
    return check;
  }

  Future<bool> loadUserEmailEdit(String userIndex) async {
    Map result =
    await _userEmailEditRepository.loadUserEmailEdit(userIndex, _userEmail);
    if (result["status"] == "200") {
      return true;
    }
    _postMessage = result["msg"];
    return false;
  }

  bool checkUserAddress(String userAddress, String userAddressDetail) {
    bool check = _userAddress == "" || _userAddressDetail == "" ||
        (userAddress == _userAddress && userAddressDetail == _userAddressDetail)
        ? false
        : true;
    return check;
  }

  Future<bool> loadUserAddressEdit(String userIndex) async {
    Map result = await _userAddressEditRepository.loadUserAddressEdit(userIndex, _userAddress, _userAddressDetail);
    bool check = result["status"] == "200" ? true : false;
    return check;
  }

  void setUserDataEditCheckFalse() {
    _userDataEditCheck = false;
  }

  void setUserDataEditCheckTrue() {
    _userDataEditCheck = true;
  }
}
