import 'package:flutter/material.dart';

class FitnessModel {
  String index;
  String name;
  String fitnesstype;
  String fitnessfreq;
  TimeOfDay activityTime;
  int minsperday;
  DateTime startDate;
  DateTime endDate;

  FitnessModel(
      {this.index,
      @required this.name,
      @required this.fitnesstype,
      @required this.fitnessfreq,
      @required this.activityTime,
      @required this.minsperday,
      @required this.startDate,
      this.endDate});
}
