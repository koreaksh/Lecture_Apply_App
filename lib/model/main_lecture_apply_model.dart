class MainLectureApplyModel {
  final int _applyStart;

  String get applyStart => _applyStart.toString();

  final int _applyEnd;

  String get applyEnd => _applyEnd.toString();

  MainLectureApplyModel(this._applyStart, this._applyEnd);

  MainLectureApplyModel.fromJson(Map<String, dynamic> json)
      : _applyStart = json["recruitment_count"],
        _applyEnd = json["recruitment_complete_count"];
}
