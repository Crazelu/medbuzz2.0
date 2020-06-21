import 'dart:js';

import 'package:MedBuzz/core/providers/providers.dart';
import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:MedBuzz/ui/views/Home.dart';
import 'package:MedBuzz/ui/views/onboarding.dart';
import 'package:MedBuzz/ui/views/profile_page.dart';
import 'package:MedBuzz/ui/views/splash_screen.dart';
import 'package:MedBuzz/ui/views/home_page.dart';
import 'package:MedBuzz/ui/views/login_page/login_page_screen.dart';
import 'package:MedBuzz/ui/views/water_reminders/schedule_water_reminder_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'home': (context) => HomeScreen(),
          'login': (context) => LoginPage(),
          'profile': (context) => ProfilePage(),

          'onboarding' : (context) => Onboard(),

          'homepage': (context) => HomePage(),

          WaterScheduleScreen.routeName: (context) => WaterScheduleScreen(),
        },
      ),
    );
  }
}
