import 'package:flutter/cupertino.dart';

class HomeScreenModel extends ChangeNotifier {
  int _initialIndex = 0;
  int _currentIndex = 0;

  void updateCurrentIndex(int index) {
    this._currentIndex = index;
    notifyListeners();
  }

  int get initialIndex => _initialIndex;
  int get currentIndex => _currentIndex;
}
