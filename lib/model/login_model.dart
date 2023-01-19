class LoginModel {
  late int _userIndex;
  late String _userName;
  late String _userPhoneNumber;
  late String _userEmail;
  late String _userAddress;
  late String _userAddressDetail;
  late String _memType;

  LoginModel(
    this._userIndex,
    this._userName,
    this._userPhoneNumber,
    this._userEmail,
    this._userAddress,
    this._userAddressDetail,
    this._memType,
  );

  LoginModel.fromJson(Map<String, dynamic> json)
      : _userIndex = json["memIdx"],
        _userName = json["memNM"],
        _userPhoneNumber = json["memPhone"],
        _userEmail = json["memEmail"],
        _userAddress = json["memAddress"],
        _userAddressDetail = json["memAddressDetail"],
        _memType = json["memLevelNM"];

  String getUserIndex() {
    return _userIndex.toString();
  }

  String getUserName() {
    return _userName;
  }

  String getUserPhoneNumber() {
    return _userPhoneNumber;
  }

  String getUserEmail() {
    return _userEmail;
  }

  String getUserAddress() {
    return _userAddress;
  }

  String getUserAddressDetail() {
    return _userAddressDetail;
  }

  String getMemType() {
    return _memType;
  }

  void setUserName(String name) {
    _userName = name;
  }

  void setUserPhoneNumber(String number) {
    _userPhoneNumber = number;
  }

  void setUserEmail(String email) {
    _userEmail = email;
  }

  void setUserAddress(String address, String addressDetail) {
    _userAddress = address;
    _userAddressDetail = addressDetail;
  }
}
