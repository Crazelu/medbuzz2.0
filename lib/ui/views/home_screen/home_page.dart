import 'package:MedBuzz/core/constants/route_names.dart';
import 'package:MedBuzz/ui/views/add_medication/add_medication_screen.dart';
import 'package:MedBuzz/ui/views/all_reminders/all_reminders_screen.dart';
import 'package:MedBuzz/ui/views/fitness_reminders/add_fitness_screen.dart';
import 'package:MedBuzz/ui/views/home_screen/home_screen_model.dart';
import 'package:MedBuzz/ui/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;
  Color color;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    _pageController.addListener(handlePageChange);
    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeScreenModel>(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            checkUserDragging(notification);
          },
          child: PageView(
              onPageChanged: (page) => model.updateCurrentIndex(page),
              controller: _pageController,
              children: [
                SafeArea(
                  child: ListView(physics: BouncingScrollPhysics(), children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Config.xMargin(context, 8.33),
                              vertical: Config.yMargin(context, 5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Good Morning,',
                                    style: TextStyle(
                                      fontSize: Config.xMargin(context, 5),
                                      color: color = Color(0xff333333),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 2),
                                  ),
                                  Text(
                                    'Juliana',
                                    style: TextStyle(
                                      fontSize: Config.xMargin(context, 6.66),
                                      fontWeight: FontWeight.w600,
                                      color: color = Color(0xff333333),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                padding: EdgeInsets.only(
                                    bottom: Config.xMargin(context, 8.33)),
                                icon: Icon(Icons.notifications_none),
                                iconSize: Config.xMargin(context, 8.33),
                                color: Theme.of(context).primaryColorDark,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: Config.xMargin(context, 2.77),
                              left: Config.xMargin(context, 6.66),
                              right: Config.xMargin(context, 6.66)),
                          height: Config.yMargin(context, 20),
                          width: Config.xMargin(context, 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Config.xMargin(context, 5.55)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 5,
                                //blurRadius: 2,
                                //offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Config.xMargin(context, 6.94),
                                    right: Config.xMargin(context, 6.94),
                                    top: Config.yMargin(context, 1.25),
                                    bottom: Config.yMargin(context, 2.125)),
                                child: Row(
                                  children: [
                                    Image.asset('images/waterdrop.png'),
                                    SizedBox(
                                      width: Config.xMargin(context, 3),
                                    ),
                                    Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Water tracker',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                Config.textSize(context, 3.88),
                                            color: color = Color(0xff777777),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Config.yMargin(context, 1.5),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '250ml',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    Config.xMargin(context, 5),
                                                color: color =
                                                    Color(0xff333333),
                                              ),
                                            ),
                                            Text(
                                              ' of 3500ml',
                                              style: TextStyle(
                                                fontSize: Config.textSize(
                                                    context, 3.88),
                                                color: color =
                                                    Color(0xff333333),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Config.yMargin(context, 0.375),
                                    left: Config.xMargin(context, 4.17),
                                    right: Config.xMargin(context, 6.66),
                                    bottom: Config.xMargin(context, 8.33)),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Config.yMargin(context, 2),
                                      decoration: BoxDecoration(
                                          color: color = Color(0xffEEEEEE),
                                          borderRadius: BorderRadius.circular(
                                              Config.xMargin(context, 2.77))),
                                    ),
                                    Container(
                                      height: Config.yMargin(context, 2),
                                      width: Config.xMargin(context, 25),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              Config.xMargin(context, 2.77))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: Config.xMargin(context, 6.66),
                                    right: Config.xMargin(context, 7.5),
                                    bottom: Config.xMargin(context, 6.66),
                                    top: Config.xMargin(context, 6.66)),
                                height: Config.yMargin(context, 20),
                                width: Config.xMargin(context, 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Config.xMargin(context, 5.55)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 5,
                                      //blurRadius: 2,
                                      //offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Config.xMargin(context, 4.44),
                                      right: Config.xMargin(context, 4.17)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Meal',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Config.xMargin(context, 3.88),
                                          color: color = Color(0xff777777),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 1.5),
                                      ),
                                      Text(
                                        '3500',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Config.xMargin(context, 5),
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 1),
                                      ),
                                      Text(
                                        'calories today',
                                        style: TextStyle(
                                          fontSize:
                                              Config.xMargin(context, 3.33),
                                          color: color = Color(0xff777777),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 2),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: Config.xMargin(
                                                    context, 4.44),
                                                right: Config.xMargin(
                                                    context, 4.44),
                                                top: Config.xMargin(
                                                    context, 4.44),
                                                bottom: Config.xMargin(
                                                    context, 4.44)),
                                            height: Config.yMargin(context, 1),
                                            decoration: BoxDecoration(
                                                color: color =
                                                    Color(0xffEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Config.xMargin(
                                                            context, 5.55))),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: Config.xMargin(
                                                    context, 4.44),
                                                top: Config.xMargin(
                                                    context, 4.44),
                                                bottom: Config.xMargin(
                                                    context, 4.44)),
                                            height: Config.yMargin(context, 1),
                                            width: Config.xMargin(context, 14),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .buttonColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Config.xMargin(
                                                            context, 5.55))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: Config.xMargin(context, 5.55),
                                    right: Config.xMargin(context, 6.66),
                                    bottom: Config.xMargin(context, 6.66),
                                    top: Config.xMargin(context, 6.66)),
                                height: Config.yMargin(context, 20),
                                width: Config.xMargin(context, 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Config.xMargin(context, 5.55)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 5,
                                      //blurRadius: 2,
                                      //offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Config.xMargin(context, 4.44),
                                      right: Config.xMargin(context, 4.17)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Steps',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Config.xMargin(context, 3.88),
                                          color: color = Color(0xff777777),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 1.5),
                                      ),
                                      Text(
                                        '7500',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Config.xMargin(context, 5),
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 1),
                                      ),
                                      Text(
                                        'steps today',
                                        style: TextStyle(
                                          fontSize:
                                              Config.xMargin(context, 3.33),
                                          color: color = Color(0xff777777),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 2),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: Config.xMargin(
                                                    context, 4.44),
                                                right: Config.xMargin(
                                                    context, 4.44),
                                                top: Config.xMargin(
                                                    context, 4.44),
                                                bottom: Config.xMargin(
                                                    context, 4.44)),
                                            height: Config.yMargin(context, 1),
                                            decoration: BoxDecoration(
                                                color: color =
                                                    Color(0xffEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Config.xMargin(
                                                            context, 5.55))),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: Config.xMargin(
                                                    context, 4.44),
                                                top: Config.xMargin(
                                                    context, 4.44),
                                                bottom: Config.xMargin(
                                                    context, 4.44)),
                                            height: Config.yMargin(context, 1),
                                            width: Config.xMargin(context, 14),
                                            decoration: BoxDecoration(
                                                color: color =
                                                    Color(0xff76DBC9),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Config.xMargin(
                                                            context, 5.55))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Config.textSize(context, 5.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Daily medications',
                                style: TextStyle(
                                  fontSize: Config.textSize(context, 5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: Config.textSize(context, 4.4),
                                    fontWeight: FontWeight.w600,
                                    color: color =
                                        Theme.of(context).textSelectionColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          margin: EdgeInsets.all(Config.xMargin(context, 6.67)),
                          height: Config.yMargin(context, 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Config.xMargin(context, 5.55)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 5,
                                //blurRadius: 2,
                                //offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Config.xMargin(context, 2.77)),
                                    child: Image.asset(
                                      'images/injection.png',
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Promethazine',
                                        style: TextStyle(
                                          fontSize:
                                              Config.textSize(context, 4.4),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 2),
                                      ),
                                      Text(
                                        '1 shot once daily',
                                        style: TextStyle(
                                          fontSize:
                                              Config.textSize(context, 4.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: Config.xMargin(context, 8.33),
                                        left: Config.xMargin(context, 4.17)),
                                    child: Column(
                                      children: [
                                        Text(
                                          '12pm',
                                          style: TextStyle(
                                            fontSize:
                                                Config.textSize(context, 4.4),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Config.yMargin(context, 1),
                                width: Config.xMargin(context, 75),
                                child: Divider(
                                  color: Theme.of(context).primaryColorDark,
                                  indent: 5.0,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View',
                                        style: TextStyle(
                                          fontSize:
                                              Config.textSize(context, 4.4),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  FlatButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.close),
                                      label: Text(
                                        'Skip',
                                        style: TextStyle(
                                          fontSize:
                                              Config.textSize(context, 4.4),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  FlatButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.check),
                                      label: Text(
                                        'Done',
                                        style: TextStyle(
                                          fontSize:
                                              Config.textSize(context, 4.4),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Config.xMargin(context, 5.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upcoming appointments',
                                style: TextStyle(
                                  fontSize: Config.textSize(context, 5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: Config.textSize(context, 4.4),
                                    fontWeight: FontWeight.w600,
                                    color: color =
                                        Theme.of(context).textSelectionColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(Config.xMargin(context, 6.66)),
                          padding:
                              EdgeInsets.all(Config.xMargin(context, 2.22)),
                          height: Config.yMargin(context, 20),
                          width: Config.xMargin(context, 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Config.textSize(context, 5.55)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 5,
                                //blurRadius: 2,
                                //offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    Config.xMargin(context, 1.11)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'July',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Config.textSize(context, 2.5),
                                        color: color = Color(0xff777777),
                                      ),
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        fontSize:
                                            Config.textSize(context, 7.77),
                                        color: color = Color(0xff2DBFC3),
                                      ),
                                    ),
                                    Text(
                                      'Thurs',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Config.textSize(context, 2.5),
                                        color: color = Color(0xff777777),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Config.xMargin(context, 3),
                              ),
                              Container(
                                color: Colors.black45,
                                height: Config.yMargin(context, 8),
                                width: Config.xMargin(context, 0.1),
                                child: VerticalDivider(
                                  indent: Config.xMargin(context, 6.94),
                                  endIndent: Config.xMargin(context, 6.94),
                                ),
                              ),
                              SizedBox(
                                width: Config.xMargin(context, 5),
                              ),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Timing',
                                                style: TextStyle(
                                                  fontSize: Config.textSize(
                                                      context, 3.33),
                                                  color: color =
                                                      Color(0xff777777),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    Config.yMargin(context, 1),
                                              ),
                                              Text(
                                                '6.00 PM',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: Config.textSize(
                                                      context, 3.88),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: Config.xMargin(context, 9),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Appointment for',
                                                style: TextStyle(
                                                  fontSize: Config.textSize(
                                                      context, 3.33),
                                                  color: color =
                                                      Color(0xff777777),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    Config.yMargin(context, 1),
                                              ),
                                              Text(
                                                'Dance Class',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: Config.textSize(
                                                      context, 3.88),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Config.yMargin(context, 3),
                                        width: Config.xMargin(context, 63),
                                        child: Divider(
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          //indent: 50.0,
                                          endIndent: 10.0,
                                        ),
                                      ),
                                      Container(
                                        width: Config.xMargin(context, 50),
                                        height: Config.yMargin(context, 6),
                                        child: Text(
                                          'Make sure to make lots of friends',
                                          style: TextStyle(
                                            fontSize:
                                                Config.xMargin(context, 3.88),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(Icons.more_vert),
                                  onPressed: () {},
                                  padding: EdgeInsets.only(
                                      bottom: Config.yMargin(context, 12.5),
                                      left: Config.xMargin(context, 7.77)),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                AllRemindersScreen(),
                ProfilePage(),
              ]),
        ),
        floatingActionButton: model.currentIndex != 0
            ? Container()
            : SpeedDial(
                backgroundColor: Theme.of(context).primaryColor,
                onOpen: () {
                  setState(() {
                    isPressed = true;
                  });
                },
                onClose: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                child: Icon(isPressed == true ? Icons.close : Icons.add),
                overlayColor: Colors.black,
                overlayOpacity: 0.7,
                children: [
                  SpeedDialChild(
                    child: Image(image: AssetImage('images/calender.png')),
                    backgroundColor: Colors.white,
                    labelWidget: Container(
                      margin:
                          EdgeInsets.only(right: Config.xMargin(context, 4)),
                      child: Text(
                        'Appointment',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.scheduleAppointmentScreen);
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: Colors.white,
                    child: Image(image: AssetImage('images/drugoutline.png')),
                    labelWidget: Container(
                      margin:
                          EdgeInsets.only(right: Config.xMargin(context, 4)),
                      child: Text(
                        'Medication',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMedicationScreen()));
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: Colors.white,
                    child: Image(image: AssetImage('images/dumbell.png')),
                    labelWidget: Container(
                      margin:
                          EdgeInsets.only(right: Config.xMargin(context, 4)),
                      child: Text(
                        'Fitness',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.fitnessDescriptionScreen);
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: Colors.white,
                    child: Image(image: AssetImage('images/dropoutline.png')),
                    labelWidget: Container(
                      margin:
                          EdgeInsets.only(right: Config.xMargin(context, 4)),
                      child: Text(
                        'Water',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.scheduleWaterReminderScreen);
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: Colors.white,
                    child: Image(image: AssetImage('images/foood.png')),
                    labelWidget: Container(
                      margin:
                          EdgeInsets.only(right: Config.xMargin(context, 4)),
                      child: Text(
                        'Diet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.scheduleDietReminderScreen);
                    },
                  ),
                ],
              ),
        //Crazelu extracted BottomNavigationBar widget to Widgets folder
        bottomNavigationBar: isPressed == true
            ? null
            : BubbledNavigationBar(
                controller: _menuPositionController,
                initialIndex: 0,
                defaultBubbleColor: Theme.of(context).primaryColorLight,
                backgroundColor: Theme.of(context).focusColor,
                onTap: (index) {
                  model.updateCurrentIndex(index);
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuad);
                },
                items: <BubbledNavigationBarItem>[
                  BubbledNavigationBarItem(
                    icon: Icon(CupertinoIcons.home,
                        size: Config.xMargin(context, 8.33),
                        color: Theme.of(context).primaryColorDark),
                    activeIcon: Icon(CupertinoIcons.home,
                        size: Config.xMargin(context, 8.33),
                        color: Colors.blueAccent),
                    title: Text(
                      'Home',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w500,
                          fontSize: Config.textSize(context, 3.5)),
                    ),
                  ),
                  BubbledNavigationBarItem(
                    icon: Icon(CupertinoIcons.bell,
                        size: Config.xMargin(context, 8.33),
                        color: Theme.of(context).primaryColorDark),
                    activeIcon: Icon(CupertinoIcons.bell,
                        size: Config.xMargin(context, 8.33),
                        color: Colors.blueAccent),
                    title: Text(
                      'Reminders',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w500,
                          fontSize: Config.textSize(context, 3.5)),
                    ),
                  ),
                  BubbledNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled,
                        size: Config.xMargin(context, 8.33),
                        color: Theme.of(context).primaryColorDark),
                    activeIcon: Icon(CupertinoIcons.profile_circled,
                        size: Config.xMargin(context, 8.33),
                        color: Colors.blueAccent),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w500,
                          fontSize: Config.textSize(context, 3.5)),
                    ),
                  ),
                ],
              ));
  }
}
