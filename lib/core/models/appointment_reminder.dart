import 'package:flutter/material.dart';

class AppointmentModel {
  final String doctorsName;
  final String appointmentType;
  final String note;
  final TimeOfDay appointmentTime;
  final DateTime date;

  AppointmentModel(
      {@required this.doctorsName,
      @required this.appointmentType,
      this.note,
      @required this.appointmentTime,
      @required this.date});
}
