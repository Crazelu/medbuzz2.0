import 'package:MedBuzz/ui/views/schedule-appointment/schedule_appointment_reminder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'dart:ui';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:MedBuzz/ui/views/schedule-appointment/all_scheduled_appointment_reminders_model.dart';
import 'package:MedBuzz/core/constants/route_names.dart';

class ScheduledAppointmentsPage extends StatefulWidget {
  @override
  _ScheduledAppointmentsPageState createState() {
    return _ScheduledAppointmentsPageState();
  }
}

class _ScheduledAppointmentsPageState extends State<ScheduledAppointmentsPage> {
  var items = ['hi', 'hello', 'good', 'new', 'hi', 'now'];
  dynamic reminderMessage = 'Make sure to make lots of friends.';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        backgroundColor: appThemeLight.backgroundColor,
        appBar: AppBar(
          backgroundColor: appThemeLight.appBarTheme.color,
          title: Container(
            child: Container(
              child: new Text(
                'My Appointments',
                style: appThemeLight.textTheme.headline5,
                textScaleFactor: 1.5,
              ),
            ),
          ),
          leading: Container(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: appThemeLight.appBarTheme.iconTheme.color,
              ),

              // navigate to add appointments page

              onPressed: () => {
                Navigator.pushReplacementNamed(context, RouteNames.homePage)
              },
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: appThemeLight.primaryColor,
            labelColor: appThemeLight.primaryColorDark.withOpacity(0.9),
            unselectedLabelColor:
                appThemeLight.primaryColorDark.withOpacity(0.9),
            indicatorWeight: 2.0,
            tabs: [
              Tab(
                child: Text(
                  'Upcoming',
                  style: appThemeLight.textTheme.headline6,
                ),
              ),
              Tab(
                child: Text(
                  'Past',
                  style: appThemeLight.textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pushReplacementNamed(context, RouteNames.homePage);
            return Future.value(false);
          },
          child: TabBarView(
            children: [
              ListView.builder(
                // Let the ListView know how many items it needs to build.
                itemCount: items.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  // final item = items[index];

                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'July',
                              style: TextStyle(
                                fontFamily: 'Segoe',
                                color: appThemeLight.primaryColorDark
                                    .withOpacity(0.7),
                                fontSize: Config.textSize(context, 2.15),
                              ),
                              textScaleFactor: 0.70,
                            ),
                            Text(
                              '12',
                              style: TextStyle(
                                fontFamily: 'Segoe',
                                fontSize: Config.textSize(context, 3.48),
                                color: appThemeLight.highlightColor,
                              ),
                              textScaleFactor: 0.85,
                            ),
                            Text(
                              'Thurs',
                              style: TextStyle(
                                fontFamily: 'Segoe',
                                color: appThemeLight.primaryColorDark
                                    .withOpacity(0.70),
                                fontSize: Config.textSize(context, 2.15),
                              ),
                              textScaleFactor: 0.75,
                            ),
                          ],
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Timing',
                                  style: TextStyle(
                                    fontFamily: 'Segoe',
                                    color: appThemeLight.primaryColorDark
                                        .withOpacity(0.6),
                                    fontSize: Config.textSize(context, 4.0),
                                  ),
                                ),
                                SizedBox(
                                  width: Config.xMargin(context, 2.0),
                                ),
                                Text(
                                  'Appointment For',
                                  style: TextStyle(
                                    fontFamily: 'Segoe',
                                    color: appThemeLight.primaryColorDark
                                        .withOpacity(0.6),
                                    fontSize: Config.textSize(context, 4.0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Config.yMargin(context, 1.0),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '6:00PM',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      color: appThemeLight.primaryColorDark
                                          .withOpacity(0.9),
                                      fontSize: Config.textSize(context, 4.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Config.xMargin(context, 2.0),
                                  ),
                                  Text(
                                    'Dance Class',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      color: appThemeLight.primaryColorDark
                                          .withOpacity(0.9),
                                      fontSize: Config.textSize(context, 4.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Config.yMargin(context, 4.0),
                              child: Center(
                                child: Divider(
                                  thickness: 1.5,
                                  color: appThemeLight.primaryColorDark
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                reminderMessage,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: appThemeLight.primaryColorDark
                                      .withOpacity(0.8),
                                  fontSize: Config.textSize(context, 3.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert,
                              size: Config.yMargin(context, 3.0),
                              color: Colors.grey,
                            ),
                            itemBuilder: (BuildContext context) {
                              return menuitems.map((MenuItem menuitem) {
                                return PopupMenuItem(
                                  enabled: true,
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        menuitem.menuValue,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onTap: () => {
                                      if (menuitem.menuValue == 'Edit')
                                        {
                                          // navigate to single view appointment screen with edit functionality
                                        }
                                      else if ((menuitem.menuValue == 'Delete'))
                                        {
                                          _asyncConfirmDialog(context),
                                        },
                                    },
                                  ),
                                );
                              }).toList();
                            }),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                // Let the ListView know how many items it needs to build.
                itemCount: items.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  // final item = items[index];

                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'July',
                              style: TextStyle(
                                fontFamily: 'Segoe',
                                color: appThemeLight.primaryColorDark
                                    .withOpacity(0.7),
                                fontSize: Config.textSize(context, 2.15),
                              ),
                              textScaleFactor: 0.70,
                            ),
                            Text(
                              '12',
                              style: TextStyle(
                                fontFamily: 'Segoe',
                                fontSize: Config.textSize(context, 3.48),
                                color: appThemeLight.highlightColor,
                              ),
                              textScaleFactor: 0.85,
                            ),
                            Text(
                              'Thurs',
                              style: TextStyle(
                                fontFamily: 'Segoe',
                                color: appThemeLight.primaryColorDark
                                    .withOpacity(0.70),
                                fontSize: Config.textSize(context, 2.15),
                              ),
                              textScaleFactor: 0.75,
                            ),
                          ],
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Timing',
                                  style: TextStyle(
                                    fontFamily: 'Segoe',
                                    color: appThemeLight.primaryColorDark
                                        .withOpacity(0.6),
                                    fontSize: Config.textSize(context, 4.0),
                                  ),
                                ),
                                SizedBox(
                                  width: Config.xMargin(context, 2.0),
                                ),
                                Text(
                                  'Appointment For',
                                  style: TextStyle(
                                    fontFamily: 'Segoe',
                                    color: appThemeLight.primaryColorDark
                                        .withOpacity(0.6),
                                    fontSize: Config.textSize(context, 4.0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Config.yMargin(context, 1.0),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '6:00PM',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      color: appThemeLight.primaryColorDark
                                          .withOpacity(0.9),
                                      fontSize: Config.textSize(context, 4.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Config.xMargin(context, 2.0),
                                  ),
                                  Text(
                                    'Dance Class',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      color: appThemeLight.primaryColorDark
                                          .withOpacity(0.9),
                                      fontSize: Config.textSize(context, 4.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Config.yMargin(context, 4.0),
                              child: Center(
                                child: Divider(
                                  thickness: 1.5,
                                  color: appThemeLight.primaryColorDark
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                reminderMessage,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: appThemeLight.primaryColorDark
                                      .withOpacity(0.8),
                                  fontSize: Config.textSize(context, 3.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert,
                              size: Config.yMargin(context, 3.0),
                              color: Colors.grey,
                            ),
                            itemBuilder: (BuildContext context) {
                              return menuitems.map((MenuItem menuitem) {
                                return PopupMenuItem(
                                  enabled: true,
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        menuitem.menuValue,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onTap: () => {
                                      if (menuitem.menuValue == 'Edit')
                                        {
                                          // navigate to single view appointment screen with edit functionality
                                        }
                                      else if ((menuitem.menuValue == 'Delete'))
                                        {
                                          _asyncConfirmDialog(context),
                                        },
                                    },
                                  ),
                                );
                              }).toList();
                            }),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ConfirmAction { Cancel, Delete }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'One appointment will be deleted.',
          style: appThemeLight.textTheme.headline6,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            color: appThemeLight.primaryColorDark.withOpacity(0.2),
            onPressed: () {
              // go back to scheduled appointments page
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: const Text(
              'Delete',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12.0,
                color: Colors.red,
              ),
            ),
            color: appThemeLight.primaryColorDark.withOpacity(0.2),
            onPressed: () {
              // delete action
              Navigator.of(context).pop(ConfirmAction.Delete);
            },
          )
        ],
      );
    },
  );
}
