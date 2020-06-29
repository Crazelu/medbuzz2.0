import 'package:flutter/material.dart';

class DietModel {
  final String dietName;
  final TimeOfDay time;
  final DateTime startDate;

  // Incase this will be used for a three-square meal reminder, I'll include optional fields

  final String secondDietName;
  final String thirdDietName;
  final TimeOfDay secondTime;
  final TimeOfDay thirdTime;
  //optional end date, if not suppplied, notification should probably be set for just the start date
  final DateTime endDate;

  DietModel(
      {@required this.dietName,
      @required this.time,
      @required this.startDate,
      this.secondDietName,
      this.thirdDietName,
      this.secondTime,
      this.thirdTime,
      this.endDate});
}
