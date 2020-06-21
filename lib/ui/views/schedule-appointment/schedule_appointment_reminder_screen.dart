import 'dart:ui';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:flutter/material.dart';
import 'package:MedBuzz/core/widgets/timer_wheel.dart';
import 'package:MedBuzz/ui/views/schedule-appointment/schedule_appointment_screen_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  @override
  _ScheduleAppointmentScreenState createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  //Table calendar object class
  CalendarController _controller;
  final TextEditingController _typeOfAppointmentController =
      TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  //Instantiating a Config object to handle responsiveness
  Config config = Config();

//  var _months = [
//    "January",
//    "February",
//    "March",
//    "April",
//    "May",
//    "June",
//    "July",
//    "August",
//    "September",
//    "October",
//    "November",
//    "December",
//  ];
//
//  var _currentMonthSelected = "January";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    print(Config.xMargin(context, 1));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
            color: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.keyboard_backspace),
            // This function navigates to the previous screen
            onPressed: () {}),
        title: Text(
          'Add your appointments',
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorDark),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 35),
          child: ListView(
            children: <Widget>[
              // Widget from the table calendar object, this widget could later be replaced with a ListView.builder
              TableCalendar(
                  initialCalendarFormat: CalendarFormat.week,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    centerHeaderTitle: true,
                  ),
                  onDaySelected: (date, event) {},
                  calendarStyle: CalendarStyle(
                      selectedColor: Theme.of(context).primaryColor),
                  calendarController: _controller),
              SizedBox(
                height: Config.xMargin(context, 2.43),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Time',
                    style: TextStyle(
                      color: Color(0xFFC4C4C4),
                    ),
                  ),
                  Container(
                    height: height * 0.2,
                    transform: Matrix4.translationValues(
                        0.0, -Config.yMargin(context, 10), 0.0),
                    //TimePickerSpinner a plugin that was tweaked to give the required result
                    child: TimePickerSpinner(
                      is24HourMode: false,
                      isForce2Digits: true,
                      spacing: 60,
                      itemHeight: height * 0.1,
                      alignment: Alignment.center,
                      onTimeChange: (val) {},
                    ),
                  ),
                  Text(
                    'Appointment For:',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  SizedBox(
                    height: Config.yMargin(context, 3.65),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(47, 14, 37, 27),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'What appointment are you going for',
                            style: TextStyle(
                              color: Color(0xFFC4C4C4),
                            ),
                          ),
                          TextField(
                            // Input for type of appointment
                            controller: _typeOfAppointmentController,
                          ),
                          SizedBox(
                            height: Config.yMargin(context, 2.43),
                          ),
                          Text(
                            'Write a note',
                            style: TextStyle(
                              color: Color(0xFFC4C4C4),
                            ),
                          ),
                          SizedBox(
                            height: Config.yMargin(context, 2.43),
                          ),
                          TextField(
                            //Input field for additional notes
                            controller: _noteController,
                            selectionHeightStyle: BoxHeightStyle.tight,
                            keyboardType: TextInputType.multiline,
                            maxLines: 9,
                            decoration: InputDecoration(
                                filled: true, border: OutlineInputBorder()),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Config.yMargin(context, 2.43),
              ),
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Save',
                  style: TextStyle(),
                ),
                // When this button is pressed, it saves the appointment to the DB
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

//class DateAndDay extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Text(
//            '12',
//            style: TextStyle(
//                fontSize: Config.textSize(context, 7.29),
//                fontWeight: FontWeight.w500),
//          ),
//          Text(
//            'Thurs',
//            style: TextStyle(
//                color: Color(0xFFC4C4C4),
//                fontSize: Config.textSize(context, 2.92)),
//          )
//        ],
//      ),
//    );
//  }
//}
