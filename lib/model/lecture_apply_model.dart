class LectureApplyModel {
  final String _title;
  final String _userName;

  LectureApplyModel(this._title, this._userName);

  LectureApplyModel.fromJson(Map<String, dynamic> json)
      : _title = json["lciNM"],
        _userName = json["lciOwner"];

  String getTitle() {
    return _title;
  }

  String getUserName() {
    return _userName;
  }
}
