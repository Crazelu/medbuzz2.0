import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'water_reminder.g.dart';

@HiveType()
class WaterReminder {
  @HiveField(0)
  int ml;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  List<int> firstTime;

  @HiveField(3)
  String id;

  WaterReminder(
      {@required this.ml,
      @required this.firstTime,
      @required this.id,
      @required this.dateTime});
}
