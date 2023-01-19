class LectureListModel {
  final int _index;
  final String _title;
  final String _description;
  final String _complete;
  final String _admin;
  final String _startDate;
  final String _endDate;
  final String _image;
  final String _pay;

  LectureListModel(
    this._index,
    this._title,
    this._startDate,
    this._endDate,
    this._description,
    this._admin,
    this._complete,
    this._image,
    this._pay,
  );

  //fromJson map구조에서 새로운 객체를 생성하기 위한 생성자.
  LectureListModel.fromJson(Map<String, dynamic> json)
      : _index = json["lciIdx"] as int,
        _title = json["lciNM"] as String,
        _startDate = json["lciStartDT"] as String,
        _endDate = json["lciEndDT"] as String,
        _description = json["lciContent"] as String,
        _admin = json["lciOwner"] as String,
        _complete = json["status"] as String,
        _image = json["hmaHref"] as String,
        _pay = json["lciIsFree"] as String;

  String getTitle() {
    return _title;
  }

  String getDescription() {
    return _description;
  }

  String getComplete() {
    return _complete;
  }

  String getAdmin() {
    return _admin;
  }

  String getStartDate() {
    return _startDate;
  }

  String getEndDate() {
    return _endDate;
  }

  String getImage() {
    return _image;
  }

  int getIndex() {
    return _index;
  }

  String getPay() {
    return _pay;
  }
}
