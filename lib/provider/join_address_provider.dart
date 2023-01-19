import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

class JoinAddressProvider extends ChangeNotifier {

  String _address = "주소를 검색해주세요.";
  String get address => _address;

  String _detailAddress = "";
  String get detailAddress => _detailAddress;

  void setDetailAddress(String address) {
    _detailAddress = address;
  }

  void loadAddressFindScreen(BuildContext context) async {
    Kpostal result = await Navigator.push(context, MaterialPageRoute(builder: (_) => KpostalView()));
    _address = result.address;
    notifyListeners();
  }

  void clearAddress() {
    _address = "주소를 검색해주세요.";
    _detailAddress = "";
  }

  String getAddress() {
    String address = _address == "주소를 검색해주세요." ?  "" :  _address;
    return address;
  }

  String getDetailAddress() {
    String detailAddress = _detailAddress == "" ? "" : _detailAddress;
    return detailAddress;
  }

  Color getAddressColor() {
    Color color = _address == "주소를 검색해주세요." ? Color(0xffC1C1C1) : Colors.black;
    return color;
  }
}