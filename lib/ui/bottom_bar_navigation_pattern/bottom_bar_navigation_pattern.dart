import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:MedBuzz/ui/views/all_reminders/all_reminders_screen.dart';
import 'package:MedBuzz/ui/views/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:MedBuzz/ui/bottom_bar_navigation_pattern/animated_bottom_bar.dart';

class BottomBarNavigationPatternHome extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Color(0xff617ADC),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),

    BarItem(
      text: "Reminders",
      iconData: Icons.notifications_none,
      color: Color(0xff617ADC),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
  ];


  @override
  _BottomBarNavigationPatternHomeState createState() =>
      _BottomBarNavigationPatternHomeState();
}

class _BottomBarNavigationPatternHomeState
    extends State<BottomBarNavigationPatternHome> {
  int selectedBarIndex = 0;
  Color color;
//  final List<Widget> pages = [
//    HomePage(),
//    AllRemindersScreen(),
//  ];


  @override
  Widget build(BuildContext context) {
    return AnimatedBottomBar(
            barItems: widget.barItems,
            animationDuration: const Duration(milliseconds: 150),
            barStyle: BarStyle(
              fontSize: Config.textSize(context, 4),
              iconSize: Config.xMargin(context, 8.33),
            ),
            onBarTap: (index) {
              print(index);
              setState(() {
                selectedBarIndex = index;
              });
            });

  }
}
