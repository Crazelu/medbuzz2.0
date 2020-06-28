import 'package:flutter/material.dart';

class MedicationsModel {
  final String drugName;
  final String drugType;
  final int dosage;
  final int frequency;
  final TimeOfDay time;
  final DateTime startDate;
  //optional fields in case the user only wants to set the reminder once

  final TimeOfDay secondTime;
  final TimeOfDay thirdTime;
  final DateTime endDate;

  MedicationsModel(
      {@required this.drugName,
      @required this.drugType,
      @required this.dosage,
      @required this.frequency,
      @required this.time,
      @required this.startDate,
      this.secondTime,
      this.thirdTime,
      this.endDate});
}
