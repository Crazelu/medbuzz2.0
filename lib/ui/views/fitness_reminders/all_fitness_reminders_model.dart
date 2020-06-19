import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitnessSchedulesModel extends ChangeNotifier{

  bool isVisible = true;
  DateTime _selectedDay = DateTime.now();

  void updateVisibility(bool visible){
    this.isVisible = visible;
    notifyListeners();
  }
  

  //Retrieve data from DB

  //Get name of weekday
  String getWeekday(DateTime date){
     return date.weekday == 1 ? 'Mon' :  date.weekday == 2 ? 'Tue' :  date.weekday == 3 ? 'Wed' :  date.weekday == 4 ? 'Thur' :
           date.weekday == 5 ? 'Fri' :  date.weekday == 6 ? 'Sat' :  'Sun';
  }

  Color getButtonColor(BuildContext context, DateTime date){
    return date.day == _selectedDay.day
                ? Theme.of(context).buttonColor
                : Colors.grey[200];
  }

  Color getTextColor(BuildContext context, DateTime date){
     return date.day == _selectedDay.day
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).primaryColorDark;
  }

  void changeDay(DateTime date){
    this._selectedDay = date;
    notifyListeners();
  }

}