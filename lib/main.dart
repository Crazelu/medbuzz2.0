import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:MedBuzz/ui/views/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedBuzz',
      theme: appThemeLight,
      initialRoute: '/' ,
      routes: {
        '/': (BuildContext context) => HomeScreen(),
         
      },
    );
  }
}

