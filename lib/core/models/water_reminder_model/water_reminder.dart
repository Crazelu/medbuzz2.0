import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'water_reminder.g.dart';

@HiveType()
class WaterReminder {

  @HiveField(0)
  int ml;

  @HiveField(1)
  DateTime dateTime;

  WaterReminder({@required this.ml, @required this.dateTime});
}
