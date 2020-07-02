import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomNavBar(BuildContext context, var model) => BubbledNavigationBar(
      initialIndex: model.currentIndex,
      defaultBubbleColor: Theme.of(context).primaryColorLight,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: (index) {
        // handle tap to various page
        model.updateCurrentIndex(index);
        
      },
      items: <BubbledNavigationBarItem>[
        BubbledNavigationBarItem(
          icon: Icon(CupertinoIcons.home,
              size: 30, color: Theme.of(context).primaryColorDark),
          activeIcon:
              Icon(CupertinoIcons.home, size: 30, color: Colors.blueAccent),
          title: Text(
            'Home',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark, fontSize: 12),
          ),
        ),
        BubbledNavigationBarItem(
          icon: Icon(CupertinoIcons.bell,
              size: 30, color: Theme.of(context).primaryColorDark),
          activeIcon:
              Icon(CupertinoIcons.bell, size: 30, color: Colors.blueAccent),
          title: Text(
            'Reminders',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark, fontSize: 12),
          ),
        ),
        BubbledNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled,
              size: 30, color: Theme.of(context).primaryColorDark),
          activeIcon: Icon(CupertinoIcons.profile_circled,
              size: 30, color: Colors.blueAccent),
          title: Text(
            'Profile',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark, fontSize: 12),
          ),
        ),
      ],
    );
