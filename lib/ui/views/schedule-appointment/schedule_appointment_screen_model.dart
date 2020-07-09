import 'package:MedBuzz/core/models/appointment_reminder_model/appointment_reminder.dart';
import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:MedBuzz/ui/size_config/config.dart';

class MonthCount {
  String month;

  MonthCount({@required this.month});
}

List<MonthCount> monthValues = [
  MonthCount(month: 'January'),
  MonthCount(month: 'February'),
  MonthCount(month: 'March'),
  MonthCount(month: 'April'),
  MonthCount(month: 'May'),
  MonthCount(month: 'June'),
  MonthCount(month: 'July'),
  MonthCount(month: 'August'),
  MonthCount(month: 'September'),
  MonthCount(month: 'October'),
  MonthCount(month: 'November'),
  MonthCount(month: 'December'),
];

// Functions for the properties would be created and used in screen file
class ScheduleAppointmentModel extends ChangeNotifier {
  //Some static fields to load current month and prevent an error
  DateTime _today = DateTime.now();
  int _selectedDay;
  int _selectedMonth;
  var _selectedTime;
  String _typeOfAppointment;
  String _note;
  List<Appointment> _availableAppointments = [];

  ScheduleAppointmentModel() {
    this._selectedMonth = _today.month;
    this._selectedDay = _today.day;
    this._selectedTime = null;
    this._typeOfAppointment = '';
    this._note = '';
  }

  DateTime get today => _today;

  int get selectedDay => _selectedDay;

  setSelectedDay(int selectedDay) => _selectedDay = selectedDay;

  int get selectedMonth => _selectedMonth;

  setSelectedMonth(int selectedMonth) => _selectedMonth = selectedMonth;

  dynamic get selectedTime => _selectedTime;

  setSelectedTime(dynamic selectedTime) => _selectedTime = selectedTime;

  String get typeOfAppointment => _typeOfAppointment;

  setSelectedTypeOfAppointment(String typeOfAppointment) =>
      _typeOfAppointment = typeOfAppointment;

  String get note => _note;

  setSelectedNote(String note) => _note = note;

  DateTime get selectedDateTime =>
      DateTime(_today.year, _selectedMonth, _selectedDay);

  void updateSelectedMonth(String val) {
    _selectedMonth =
        monthValues.indexWhere((element) => element.month == val) + 1;
    notifyListeners();
  }

  DateTime getDateTime() {
    print(_selectedTime.toString());
    String month = _selectedMonth.toString().length < 2
        ? '0$_selectedMonth'
        : '$_selectedMonth';
    String weekday =
        _selectedDay.toString().length < 2 ? '0$_selectedDay' : '$_selectedDay';
    return DateTime.parse(
        '${_today.year}-$month-$weekday ${_selectedTime.substring(0, 2)}:${_selectedTime.substring(3, 5)}');
  }

//
  Appointment createSchedule() {
    var dayValue =
        selectedDay.toString().length < 2 ? '0$selectedDay' : '$selectedDay';
    var monthValue = selectedMonth.toString().length < 2
        ? '0$selectedMonth'
        : '$selectedMonth';

    var selectedDateTime = "${_today.year}-$monthValue-$dayValue";

    var appointmentType = typeOfAppointment.toString().length < 1
        ? 'empty 0$typeOfAppointment'
        : '$typeOfAppointment';

    var noteValue = note.toString().length < 1 ? 'empty 0$note' : '$note';

    Appointment newAppointment = Appointment(
        date: DateTime.parse(selectedDateTime),
        appointmentType: appointmentType,
        note: noteValue,
        dateTime: _selectedTime);
    return newAppointment;
  }

  void updateSelectedDay(int dayIndex) {
    _selectedDay = dayIndex + 1;
    notifyListeners();
  }

  void updateSelectedTime(dynamic time) {
    _selectedTime = time;
    //notifyListeners();
  }

  void updateAvailableAppointmentReminder(appointmentReminder) {
    _availableAppointments = appointmentReminder;
    notifyListeners();
  }

  bool isActive(index) {
    //increment index to match day index and compare
    return index + 1 == _selectedDay;
  }

  String get currentMonth {
    return monthValues[_today.month - 1].month;
  }

  String get selectedMonthValue {
    return monthValues[_today.month - 1].month;
  }

//  List<Appointment> get appointmentRemindersBasedOnDateTime{
//    return _availableAppointments.where((reminder) => selectedDateTime.day == reminder.dateTime.day).toList();
//  }

  getWeekDay(index) {
    //increment index to match month index
    index++;
    int year = _today.year;
    //check for single digit months e.g. 1,2,3 to format to 01,02,03 strings
    String month = _selectedMonth.toString().length < 2
        ? '0$_selectedMonth'
        : '$_selectedMonth';
    String weekday = index.toString().length < 2 ? '0$index' : '$index';
    //formats date to format of 2020-06-20 i.e. YYYY-MM-DD
    String val = DateFormat.E().format(
      DateTime.parse('$year' + '-' + '$month' + '-' + '$weekday'),
    );

    return val;
  }

  int get daysInMonth {
    return DateUtil().daysInMonth(_selectedMonth, _today.year);
  }

  Color getButtonColor(BuildContext context, index) {
    return isActive(index)
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColorDark.withOpacity(0.05);
  }

  TextStyle calendarTextStyle(BuildContext context, index) {
    return TextStyle(
      color: Colors.white,
      fontSize: Config.textSize(context, 6),
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle calendarSubTextStyle(BuildContext context, index) {
    return TextStyle(
      color: Colors.white,
      fontSize: Config.textSize(context, 5),
      fontWeight: FontWeight.normal,
    );

    // int get userSelectedDay => selectedDay;
    // setSelectedDay(int userSelectedDay) => selectedDay = userSelectedDay;

    // int get userSelectedMonth => selectedMonth;
    // setSelectedMonth(int userSelectedMonth) => selectedMonth = userSelectedMonth;

    // dynamic get userSelectedTime => selectedTime;
    // setSelectedTime(dynamic userSelectedTime) => selectedTime = userSelectedTime;
  }
}
