class IdCheckModel {
  final String _statusCode;
  final String _message;

  IdCheckModel(this._statusCode, this._message);

  IdCheckModel.fromJson(Map<String, dynamic> json) : _statusCode = json["status"] as String, _message = json["msg"] as String;

  String getStatusCode() {
    return _statusCode;
  }

  String getMessage() {
    return _message;
  }

}