class LectureDetailInfoModel {
  final int _lectureDetailIndex;
  final String _week;
  final String _lectureStartDate;
  final String _lectureEndDate;
  final String _lectureStartTime;
  final String _lectureEndTime;

  LectureDetailInfoModel(this._lectureDetailIndex,
      this._week,
      this._lectureStartDate,
      this._lectureEndDate,
      this._lectureStartTime,
      this._lectureEndTime,);

  LectureDetailInfoModel.fromjson(Map<String, dynamic> json)
      : _lectureDetailIndex = json["LcdIdx"] as int,
        _week = json["LcdWeek"] as String,
        _lectureStartDate = json["LcdStartDate"] as String,
        _lectureEndDate = json["LcdEndDate"] as String,
        _lectureStartTime = json["LcdStartTime"] as String,
        _lectureEndTime = json["LcdEndTime"] as String;

  int getLectureDetailIndex() {
    return _lectureDetailIndex;
  }

  String getWeek() {
    return _week;
  }

  String getLectureStartDate() {
    return _lectureStartDate.substring(0,10);
  }

  String getLectureEndDate() {
    return _lectureEndDate.substring(0,10);
  }

  String getLectureStartTime() {
    return _lectureStartTime.substring(0,5);
  }

  String getLectureEndTime() {
    return _lectureEndTime.substring(0,5);
  }
}
