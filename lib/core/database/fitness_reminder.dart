import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/fitness_reminder_model/fitness_reminder.dart';
import '../models/fitness_reminder_model/fitness_reminder.dart';

class FitnessReminderCRUD extends ChangeNotifier {
  static const String _boxName = "fitnessReminderBox";
  List<FitnessReminder> _fitnessReminder = [];
  List<FitnessReminder> get fitnessReminder => _fitnessReminder;

  int get reminderLength {
    return _fitnessReminder.length;
  }

  void getReminders() async {
    var box = await Hive.openBox<FitnessReminder>(_boxName);
    _fitnessReminder = box.values.toList();
    notifyListeners();
  }

  getOneReminder(index) {
    return _fitnessReminder[index];
  }

  void addReminder(FitnessReminder reminder) async {
    var box = Hive.box<FitnessReminder>(_boxName);
    await box.put(reminder.id, reminder);
    _fitnessReminder = box.values.toList();
    box.close();
    notifyListeners();
  }

  void editReminder(FitnessReminder reminder) async {
    int key = reminder.index;
    var box = Hive.box<FitnessReminder>(_boxName);
    await box.putAt(key, reminder);
    _fitnessReminder = box.values.toList();
    box.close();
    notifyListeners();
  }

  void deleteReminder(key) async {
    var box = await Hive.openBox<FitnessReminder>(_boxName);

    _fitnessReminder = box.values.toList();
    box.delete(key);
    box.close();

    notifyListeners();
  }
}
