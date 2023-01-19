class LectureLatestModel {
  final String _title;
  final String _admin;
  final String _date;

  String get title => _title;
  String get admin => _admin;
  String get date => _date.substring(0,10);

  LectureLatestModel(this._title, this._admin, this._date);

  LectureLatestModel.fromJson(Map<String, dynamic> json)
      : _title = json["lciNM"],
        _admin = json["lciOwner"],
        _date = json["lciRegEndDT"];


}
