import 'package:flutter/material.dart';

class JoinPhoneNumberProvider extends ChangeNotifier {
  String _firstPhoneNumber = "010";
  String get firstPhoneNumber => _firstPhoneNumber;

  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  void setFirstPhoneNumber(String number) {
    _firstPhoneNumber = number;
    notifyListeners();
  }

  void setPhoneNumber(String number) {
    _phoneNumber = number;
  }

  String getPhoneNumber() {
    return _firstPhoneNumber+_phoneNumber;
  }

  void clearPhoneNumber() {
    _phoneNumber = "";
  }
}