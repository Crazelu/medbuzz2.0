import 'package:hive/hive.dart';

part 'appointment_reminder.g.dart';

@HiveType()
class Appointment {
  @HiveField(0)
  DateTime appointmentMonth;
  @HiveField(1)
  DateTime appointmentDay;
  @HiveField(2)
  DateTime appointmentTime;
  @HiveField(3)
  String appointmentSubject;
  @HiveField(4)
  String appointmentNote;

  Appointment(
      {this.appointmentMonth,
      this.appointmentDay,
      this.appointmentTime,
      this.appointmentSubject,
      this.appointmentNote});
}
