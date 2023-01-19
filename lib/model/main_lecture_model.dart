class MainLectureModel {
  final int _lectureStart;

  String get lectureStart => _lectureStart.toString();

  final int _lectureEnd;

  String get lectureEnd => _lectureEnd.toString();

  MainLectureModel(this._lectureStart, this._lectureEnd);

  MainLectureModel.fromJson(Map<String, dynamic> json)
      : _lectureStart = json["lecProcessing_count"],
        _lectureEnd = json["lecComplete_count"];

}