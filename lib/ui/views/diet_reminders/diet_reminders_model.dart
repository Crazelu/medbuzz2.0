import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietReminderModel extends ChangeNotifier {
  String _selectedMonth;
  dynamic _selectedTime;

  void updateSelectedTime(dynamic time) {
    this._selectedTime = time;
  }

  void _getCurrentMonth() {
    switch (DateTime.now().month) {
      case 1:
        this._selectedMonth = 'January';
        notifyListeners();
        break;
      case 2:
        this._selectedMonth = 'February';
        notifyListeners();
        break;
      case 3:
        this._selectedMonth = 'March';
        notifyListeners();
        break;
      case 4:
        this._selectedMonth = 'April';
        notifyListeners();
        break;
      case 5:
        this._selectedMonth = 'May';
        notifyListeners();
        break;
      case 6:
        this._selectedMonth = 'June';
        notifyListeners();
        break;
      case 7:
        this._selectedMonth = 'July';
        notifyListeners();
        break;
      case 8:
        this._selectedMonth = 'August';
        notifyListeners();
        break;
      case 9:
        this._selectedMonth = 'September';
        notifyListeners();
        break;
      case 10:
        this._selectedMonth = 'October';
        notifyListeners();
        break;
      case 11:
        this._selectedMonth = 'November';
        notifyListeners();
        break;
      case 12:
        this._selectedMonth = 'December';
        notifyListeners();
        break;
    }
  }

  void get getCurrentMonth => _getCurrentMonth();
  String get currentMonth => _selectedMonth;
  dynamic get selectedTime => _selectedTime;

  void updateSelectedMonth(String newMonth) {
    this._selectedMonth = newMonth;
    notifyListeners();
  }

  List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'Octobder',
    'November',
    'December'
  ];
  List<String> get months => _months;
  bool isVisible = true;

  //functionality for making the FAB appear and disappear when user scrolls
  void updateVisibility(bool visible) {
    this.isVisible = visible;
    notifyListeners();
  }
}
