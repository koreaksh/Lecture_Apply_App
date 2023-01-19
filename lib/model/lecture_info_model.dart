import 'dart:ffi';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureInfoModel {
  final String _image;
  final String _complete;
  final String _title;
  final String _description;
  final String _admin;
  final String _registerStart;
  final String _registerEnd;
  final int _limitedNum;
  final String _address;
  final String _addressDetail;
  final String _lat;
  final String _lng;
  final String _pay;
  final int _nowApplyCount;
  final String _adminAboutLink;
  final String _lectureAboutLink;

  LectureInfoModel(
    this._image,
    this._complete,
    this._title,
    this._description,
    this._admin,
    this._registerStart,
    this._registerEnd,
    this._limitedNum,
    this._address,
    this._addressDetail,
    this._lat,
    this._lng,
    this._pay,
    this._nowApplyCount,
    this._adminAboutLink,
    this._lectureAboutLink,
  );

  LectureInfoModel.fromJson(Map<String, dynamic> json)
      : _image = json["hmaHref"] as String,
        _complete = json["status"] as String,
        _title = json["lciNM"] as String,
        _description = json["lciContent"] as String,
        _admin = json["lciOwner"] as String,
        _registerStart = json["lciRegStartDT"] as String,
        _registerEnd = json["lciRegEndDT"] as String,
        _limitedNum = json["lciLimit"] as int,
        _address = json["lciAddress"] as String,
        _addressDetail = json["lciAddressDetail"] as String,
        _lat = json["lciLat"] as String,
        _lng = json["lciLng"] as String,
        _pay = json["lciIsFree"] as String,
        _nowApplyCount = json["nowApplyCount"] as int,
        _adminAboutLink = json["letHmaHref"] as String,
        _lectureAboutLink = json["subFile"] as String;

  String getLectureAboutLink() {
    return _lectureAboutLink;
  }

  String getAdminAboutLink() {
    return _adminAboutLink;
  }

  String getImage() {
    return _image;
  }

  String getComplete() {
    return _complete;
  }

  String getTitle() {
    return _title;
  }

  String getDescription() {
    return _description;
  }

  String getAdmin() {
    return _admin;
  }

  String getRegisterStart() {
    return _registerStart.substring(0, 10);
  }

  String getRegisterEnd() {
    return _registerEnd.substring(0, 10);
  }

  String getLimitedNum() {
    return _limitedNum.toString();
  }

  String getAddress() {
    return _address;
  }

  String getAddressDetail() {
    return _addressDetail;
  }

  double getLat() {
    double lat = _lat != "" ? double.parse(_lat) : 37.73805528997969;
    return lat;
  }

  double getLng() {
    double lng = _lng != "" ? double.parse(_lng) : 127.03390476225881;
    return lng;
  }

  String getPay() {
    return _pay;
  }

  String getNowApplyCount() {
    return _nowApplyCount.toString();
  }
}
