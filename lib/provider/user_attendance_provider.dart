import 'package:flutter/cupertino.dart';
import 'package:shinhanapp/repository/user_attendance_repository.dart';

class UserAttendanceProvider extends ChangeNotifier {
  final UserAttendanceRepository _userAttendanceRepository =
      UserAttendanceRepository();

  List<dynamic> _listData = [];
  int _attendanceAllCount = 0;
  bool _check = false;
  int _attendanceCount = 0;
  int _absentCount = 0;
  int _attendancePercent = 0;
  String _address = "";
  String _addressDetail = "";

  int get attendanceAllCount => _attendanceAllCount;

  bool get check => _check;

  int get attendanceCount => _attendanceCount;

  int get absentCount => _absentCount;

  int get attendancePercent => _attendancePercent;

  String get addressDetail => _addressDetail;

  void loadUserAttendance(
      String userIndex, String lectureIndex, String lectureDetailIndex) async {
    Map<String, dynamic> result = await _userAttendanceRepository
        .loadAttendance(userIndex, lectureIndex, lectureDetailIndex);
    if (result["status"] != "200") {
      _check = false;
      return;
    }
    _attendanceAllCount = result["data"]["LcdTotalCount"];
    _listData = result["data"]["lectureDate"];
    _attendanceCount = result["data"]["attendance_cnt"];
    _absentCount = result["data"]["absent_cnt"];
    _attendancePercent = result["data"]["processed"];
    _address = result["data"]["LcdAddress"];
    _addressDetail = result["data"]["LcdAddressDetail"];
    _check = true;
    notifyListeners();
  }

  void clear() {
    _listData = [];
    _attendanceAllCount = 0;
    _check = false;
    _attendanceCount = 0;
    _absentCount = 0;
    _attendancePercent = 0;
  }


  String getAddress() {
    if (_address == "") {
      return "";
    }
    return _address.substring(8);
  }

  String getDate(int itemIndex) {
    return _listData[itemIndex]["checkDT"];
  }

  String getAttendanceStatusText(int itemIndex) {
    String check = _listData[itemIndex]["status"];

    if (check == "0") {
      return "결석";
    } else if (check == "1") {
      return "출석";
    } else {
      return "예정";
    }
  }

  Color getAttendanceStatusColor(int itemIndex) {
    String check = _listData[itemIndex]["status"];
    if (check == "0") {
      return const Color(0xffFF5078);
    } else if (check == "1") {
      return const Color(0xff0099FF);
    } else {
      return const Color(0xffC1C1C1);
    }
  }
}
