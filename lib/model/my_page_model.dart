import 'dart:ffi';

class MyPageModel {
  final String _title;
  final String _admin;
  final String _nextDate;
  final String _startDate;
  final String _endDate;
  final String _startTime;
  final _lat;
  final _lng;
  final String _lectureState;
  final String _address;
  final String _addressDetail;
  final String _pay;
  final int _detailIndex;
  final int _lectureIndex;

  MyPageModel(
    this._title,
    this._admin,
    this._nextDate,
    this._startDate,
    this._endDate,
    this._startTime,
    this._lat,
    this._lng,
    this._lectureState,
    this._address,
    this._addressDetail,
    this._pay,
    this._detailIndex,
    this._lectureIndex,
  );

  MyPageModel.fromJson(Map<String, dynamic> json)
      : _title = json["lciNM"],
        _admin = json["lciOwner"],
        _nextDate = json["nextLecStartDate"],
        _startDate = json["LcdStartDate"],
        _endDate = json["LcdEndDate"],
        _startTime = json["LcdStartTime"],
        _lat = json["LcdLat"],
        _lng = json["LcdLng"],
        _lectureState = json["status"],
        _address = json["LcdAddress"],
        _addressDetail = json["LcdAddressDetail"],
        _pay = json["lciIsFree"],
        _detailIndex = json["LcdIdx"],
        _lectureIndex = json["lciIdx"];

  String getLectureIndex() {
    return _lectureIndex.toString();
  }

  String getDetailIndex() {
    return _detailIndex.toString();
  }

  String getPay() {
    return _pay;
  }

  String getTitle() {
    return _title;
  }

  String getAdmin() {
    return _admin;
  }

  String getNextDate() {
    return _nextDate.substring(0, 10);
  }

  String getStartDate() {
    return _startDate.substring(0, 10);
  }

  String getEndDate() {
    return _endDate.substring(0, 10);
  }

  String getStartTime() {
    return _startTime.substring(0, 5);
  }

  double getLat() {
    if(_lat == "") {
      return 37.64;
    }
    return double.parse(_lat);
  }

  double getLng() {
    if(_lng == "") {
      return 127.01;
    }
    return double.parse(_lng);
  }

  String getLectureState() {
    return _lectureState;
  }

  String getAddress() {
    return _address;
  }

  String getAddressDetail() {
    return _addressDetail;
  }

  bool getLectureStateBool() {
    if (_lectureState == "신청대기" || _lectureState == "수강예정") {
      return true;
    }
    return false;
  }
}
