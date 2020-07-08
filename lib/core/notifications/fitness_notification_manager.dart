import 'package:MedBuzz/core/models/fitness_reminder.dart';
import 'package:MedBuzz/core/models/fitness_reminder_model/fitness_reminder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:MedBuzz/main.dart';
import 'package:MedBuzz/ui/views/fitness_reminders/all_fitness_reminders_screen.dart';

class FitnessNotificationManager {
  var flutterLocalNotificationsPlugin;

  FitnessNotificationManager() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    initNotifications();
  }

  getNotificationInstance() {
    return flutterLocalNotificationsPlugin;
  }

  void initNotifications() {
    // initialise the plugin.
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void showFitnessNotificationDaily(FitnessReminder reminder) async {
    var time = new Time(reminder.activityTime[0], reminder.activityTime[1], 0);
    // if (reminder.fitnessfreq == 'Daily') {
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        reminder.index,
        reminder.name,
        'Fitness reminder',
        time,
        getPlatformChannelSpecfics(reminder.index));
    // } else if (reminder.fitnessfreq == 'Every 2 days') {
    //   await flutterLocalNotificationsPlugin.periodicallyShow(
    //       reminder.index,
    //       reminder.name,
    //       'Fitness reminder',
    //       time,
    //       getPlatformChannelSpecfics(reminder.index));
    // } else if (reminder.fitnessfreq == 'Every 3 days') {
    // } else if (reminder.fitnessfreq == 'Every 4 days') {}
    print(
        'Notification Succesfully Scheduled at ${time.toString()} with id of $reminder.id');
  }

  getPlatformChannelSpecfics(int id) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '$id', 'your channel name', 'your channel description',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'Fitness Reminder');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    return platformChannelSpecifics;
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return Future.value(1);
  }

  Future onSelectNotification(String payload) async {
    print('Notification clicked');
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      MyApp.navigatorKey.currentState.context,
      MaterialPageRoute(
          builder: (context) => FitnessSchedulesScreen(payload: payload)),
    );
  }

  void removeReminder(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
    print('Notfication with id: $notificationId been removed successfully');
  }
}
