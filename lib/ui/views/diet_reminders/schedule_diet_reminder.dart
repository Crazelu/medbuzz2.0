import 'package:MedBuzz/core/widgets/time_wheel.dart';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:MedBuzz/ui/views/diet_reminders/diet_reminders_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDietReminderScreen extends StatefulWidget {
  @override
  _ScheduleDietReminderScreenState createState() =>
      _ScheduleDietReminderScreenState();
}

class _ScheduleDietReminderScreenState
    extends State<ScheduleDietReminderScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DietReminderModel>(context, listen: false).getCurrentMonth;
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<DietReminderModel>(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text('Add diet',
              style: TextStyle(color: Theme.of(context).primaryColorDark)),
          leading: IconButton(
              icon: Icon(Icons.keyboard_backspace,
                  color: Theme.of(context).primaryColorDark),

              //Function to navigate to previous screen or home screen (as the case maybe) goes here
              onPressed: () {}),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Config.yMargin(context, 1),
                  horizontal: Config.xMargin(context, 1.5)),
              child: FlatButton(
                  color: Theme.of(context).backgroundColor,
                  splashColor: Theme.of(context).backgroundColor,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius:
                          BorderRadius.circular(Config.xMargin(context, 10))),
                  child: Text('Diet Tracker',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Config.textSize(context, 3.5),
                          fontWeight: FontWeight.w600))),
            )
          ],
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: width,
              margin: EdgeInsets.symmetric(
                  horizontal: Config.xMargin(context, 3),
                  vertical: Config.yMargin(context, 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: false, icon: Icon(Icons.expand_more),
                      // here sets the value to the selected month and if null, it defaults to the present date month from DateTime.now()
                      value: model.currentMonth,
                      hint: Text(
                        'Month',
                        textAlign: TextAlign.center,
                      ),
                      items: model.months
                          .map((month) => DropdownMenuItem(
                                child: Container(
                                  child: Text(
                                    month,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                ),
                                value: month,
                              ))
                          .toList(),
                      onChanged: (val) => model.updateSelectedMonth(val),
                    ),
                  ),
                  SizedBox(height: Config.yMargin(context, 5)),
                  // TimeWheel(
                  //   updateTimeChanged: (val) => model.updateSelectedTime(val),
                  // ),
                  SizedBox(height: Config.yMargin(context, 5)),
                ],
              ),
            )));
  }
}
