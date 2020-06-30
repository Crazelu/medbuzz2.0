import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MedBuzz/core/models/medication_reminder_model/medication_reminder.dart';
import 'package:hive/hive.dart';

class MedicationData extends ChangeNotifier {
  static const String _boxName = "medicationReminderBox";

  final List drugTypes = [
    'Injection',
    'Tablets',
    'Drops',
    'Pills',
    'Ointment',
    'Syrup',
    'Inhaler'
  ];

  final List<String> times = ['Once', 'Twice', 'Thrice'];
  var selectedFreq = 'Once';
  int selectedIndex = 0;
  int dosage = 1;
  TimeOfDay firstTime = TimeOfDay.now();
  TimeOfDay secondTime = TimeOfDay.now();
  TimeOfDay thirdTime = TimeOfDay.now();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String drugName;

  List<MedicationReminder> medicationReminder = [];

  void getMedicationReminder() async {
    var medicationReminderBox =
        await Hive.openBox<MedicationReminder>(_boxName);
    medicationReminder = medicationReminderBox.values.toList();
    notifyListeners();
  }

  Future<void> addMedicationReminder(
      String index, MedicationReminder medication) async {
    var medicationReminderBox = Hive.box<MedicationReminder>(_boxName);
    await medicationReminderBox.put(index, medication);
    medicationReminder = medicationReminderBox.values.toList();
    medicationReminderBox.close();
    notifyListeners();
  }

  Future<void> editSchedule({MedicationReminder medication}) async {
    String medicationKey = medication.index;
    var medicationReminderBox = Hive.box<MedicationReminder>(_boxName);
    await medicationReminderBox.put(medicationKey, medication);

    medicationReminder = medicationReminderBox.values.toList();
    medicationReminderBox.close();

    notifyListeners();
  }

  void deleteSchedule(key) {
    var medicationReminderBox = Hive.box<MedicationReminder>(_boxName);

    medicationReminder = medicationReminderBox.values.toList();
    medicationReminderBox.delete(key);
    medicationReminderBox.close();

    notifyListeners();
  }
}
