import 'package:flutter/material.dart';
import 'package:shinhanapp/repository/join_condition_repository.dart';

class JoinConditionProvider extends ChangeNotifier {
  bool _conditionCheck = false;
  bool get conditionCheck => _conditionCheck;

  bool _typeCheck = true;
  bool get typeCheck => _typeCheck;

  String _conditionText = "";
  String get conditionText => _conditionText;

  JoinConditionRepository _joinConditionRepository = JoinConditionRepository();


  void changeConditionCheck() {
    _conditionCheck = !_conditionCheck;
  }

  void changeTypeTrue(){
    _typeCheck = true;
  }

  void changeTypeFalse() {
    _typeCheck = false;
  }

  void clear() {
    _conditionCheck = false;
    _typeCheck = true;
    _conditionText = "";
  }

  void loadCondition() async {
    String result = await _joinConditionRepository.loadCondition();
    if(result == "") return;
    _conditionText = result;
    notifyListeners();
  }

}