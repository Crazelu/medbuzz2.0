import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  Indicator({this.currentIndex, this.positionIndex});
  final Config config = Config();
  @override
  Widget build(BuildContext context) {
    return Container(
          height: Config.yMargin(context, 1.8),
          width: Config.xMargin(context, 4.2),
          decoration: BoxDecoration(
              border: Border.all(color: appThemeLight.primaryColor),
              color: positionIndex == currentIndex
                  ? appThemeLight.primaryColor
                  : appThemeLight.primaryColorLight,
              borderRadius: BorderRadius.circular(100)),
        );

  }
}

      
      