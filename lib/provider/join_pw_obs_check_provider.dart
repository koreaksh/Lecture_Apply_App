import 'package:flutter/material.dart';

class JoinPwObsCheckProvider extends ChangeNotifier {
  bool _pwObs = true;
  bool get pwObs => _pwObs;

  bool _pwReObs = true;
  bool get pwReObs => _pwReObs;

  Color _pwObsColor = Color(0xffC1C1C1);
  Color _pwReObsColor = Color(0xffC1C1C1);

  Color get pwObsColor => _pwObsColor;
  Color get pwReObsColor => _pwReObsColor;

  void changePwObs() {
    if(_pwObs == true) {
      _pwObs = false;
      _pwObsColor = Colors.green;
    } else {
      _pwObs = true;
      _pwObsColor = Color(0xffC1C1C1);
    }
    notifyListeners();
  }

  void changePwReObs() {
    if(_pwReObs == true) {
      _pwReObs = false;
      _pwReObsColor = Colors.green;
    } else {
      _pwReObs = true;
      _pwReObsColor = Color(0xffC1C1C1);
    }
    notifyListeners();
  }

  void clearObs() {
    _pwObs = true;
    _pwReObs = true;
    _pwObsColor = Color(0xffC1C1C1);
    _pwReObsColor = Color(0xffC1C1C1);
  }
}