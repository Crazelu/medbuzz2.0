import 'package:MedBuzz/core/constants/route_names.dart';
import 'package:MedBuzz/core/providers/providers.dart';
import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:MedBuzz/ui/views/Home.dart';
import 'package:MedBuzz/ui/views/all_reminders/all_reminders_screen.dart';
import 'package:MedBuzz/ui/views/drug_description/drug_description.dart';
import 'package:MedBuzz/ui/views/fitness_reminders/all_fitness_reminders_screen.dart';
import 'package:MedBuzz/ui/views/forgot_password.dart';
import 'package:MedBuzz/ui/views/onboarding.dart';
import 'package:MedBuzz/ui/views/password_recovery/reset_password_screen_2.dart';
import 'package:MedBuzz/ui/views/profile_page.dart';
import 'package:MedBuzz/ui/views/schedule-appointment/schedule_appointment_reminder_screen.dart';
import 'package:MedBuzz/ui/views/snooze_reminder/confirmation_or_snooze.dart';
import 'package:MedBuzz/ui/views/splash_screen.dart';
import 'package:MedBuzz/ui/views/home_page.dart';
import 'package:MedBuzz/ui/views/login_page/login_page_screen.dart';
import 'package:MedBuzz/ui/views/water_reminders/schedule_water_reminder_screen.dart';
import 'package:MedBuzz/ui/views/signup_page/signup_screen.dart';
import 'package:MedBuzz/ui/views/schedule-appointment/all_scheduled_appointment_reminders.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/route_names.dart';
import 'ui/views/signup_page/signup_screen.dart';
import 'ui/views/water_reminders/water_reminders_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedBuzz',
        theme: appThemeLight,
        initialRoute: RouteNames.allRemindersScreen,
        routes: {
          RouteNames.splashScreen: (context) => SplashScreen(),
          RouteNames.home: (context) => HomeScreen(),
          RouteNames.login: (context) => LoginPage(),
          RouteNames.forgotPassword: (context) => ForgotPassword(),
          RouteNames.profile: (context) => ProfilePage(),
          RouteNames.onboarding: (context) => Onboard(),
          RouteNames.homePage: (context) => HomePage(),
          RouteNames.signup: (context) => Signup(),
          RouteNames.allRemindersScreen: (context) => AllRemindersScreen(),
          RouteNames.drugDescription: (context) => DrugDescription(),
          RouteNames.fitnessSchedulesScreen: (context) =>
              FitnessSchedulesScreen(),
          RouteNames.scheduleAppointmentScreen: (context) =>
              ScheduleAppointmentScreen(),
          RouteNames.scheduledAppointmentsPage: (context) =>
              ScheduledAppointmentsPage(),
          RouteNames.scheduleWaterReminderScreen: (context) =>
              ScheduleWaterReminderScreen(),
          RouteNames.waterScheduleView: (context) => WaterScheduleViewScreen(),
          RouteNames.confirmOrSnoozeReminderScreen: (context) =>
              ConfirmOrSnoozeScreen(),
          RouteNames.resetPasswordScreen2: (context) => ResetPasswordScreen2()
        },
      ),
    );
  }
}
