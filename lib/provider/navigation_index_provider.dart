import 'package:flutter/material.dart';

class NavigationIndexProvider extends ChangeNotifier {
  int _navigationIndex = 0;
  int get navigationIndex => _navigationIndex;

  void setNavigationIndex(int index) {
    if(_navigationIndex != index) {
      _navigationIndex = index;
      notifyListeners();
    }
  }

  void clearNavigation() {
    _navigationIndex = 0;
  }
}