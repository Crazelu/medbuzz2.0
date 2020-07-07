import 'package:MedBuzz/core/constants/route_names.dart';
import 'package:MedBuzz/core/database/diet_reminderDB.dart';
import 'package:MedBuzz/core/models/diet_reminder/diet_reminder.dart';
import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:provider/provider.dart';
import 'package:MedBuzz/ui/views/diet_reminders/diet_reminders_model.dart';

class DietScheduleScreen extends StatefulWidget {
  DietScheduleScreen({this.payload});

  final String payload;
  @override
  _DietScheduleScreenState createState() => _DietScheduleScreenState();
}

class _DietScheduleScreenState extends State<DietScheduleScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<DietReminderDB>(context, listen: false).getAlldiets();
    _tabController = new TabController(vsync: this, length: 2);
  }

  // final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  ScrollController controller = ScrollController();
  // List<Widget> _dietReminder = [];
  // Widget _buildItem(DietModel diet, Animation animation) {
  //   return SizeTransition(
  //     sizeFactor: animation,
  //     child: SingleChildScrollView(
  //         controller: controller, child: DietReminderCard(diet: diet)),
  //   );
  // }

  // void _insertNewDiet() {
  //   Widget newDiet = DietReminderCard();
  //   int insertIndex = 0;
  //   _dietReminder.insert(insertIndex, newDiet);
  //   _listKey.currentState.insertItem(insertIndex);
  // }

  // void removeDiet() {
  //   // Widget newDiet = DietReminderCard();
  //   int insertIndex = 0;
  //   _dietReminder.removeLast();
  //   _listKey.currentState.insertItem(insertIndex);
  // }

  TabController _tabController;

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    //This makes the FAB disappear as you scroll down
    controller.addListener(() {
      if (controller.offset < 120) {
        Provider.of<DietReminderModel>(context).updateVisibility(true);
      } else {
        Provider.of<DietReminderModel>(context).updateVisibility(false);
      }
    });

    var db = Provider.of<DietReminderDB>(context);
    var model = Provider.of<DietReminderModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Theme.of(context).primaryColorLight,
        bottom: TabBar(
          isScrollable: true,
          unselectedLabelColor: Theme.of(context).primaryColorDark,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: <Tab>[
            Tab(
              text: "Upcoming",
            ),
            Tab(
              text: "Past",
            ),
          ],
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
        ),
        title: Text(
          'My Diet Plan',
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.homePage);
            }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text(
                'Diet tracker',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius:
                    BorderRadius.circular(Config.xMargin(context, 10)),
              ),
            ),
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacementNamed(context, RouteNames.homePage);
          return Future.value(false);
        },
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
              itemCount: db.upcomingDiets.length,
              itemBuilder: (context, index) {
                var diets = db.upcomingDiets;
                var item = diets[index];
                return diets.length > 1
                    ? DietReminderCard(diet: item)
                    : Container(
                        child: Center(
                          child: Text(
                              'No diet reminder.\nClick the button to add one',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: Config.xMargin(context, 5.55))),
                        ),
                      );
              },
            ),
            ListView.builder(
              itemCount: db.pastDiets.length,
              itemBuilder: (context, index) {
                var diets = db.pastDiets;
                var item = diets[index];
                return diets.length > 1
                    ? DietReminderCard(diet: item)
                    : Container(
                        child: Center(
                          child: Text('NO PAST REMINDER',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: Config.xMargin(context, 5.55))),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: model.isVisible ? 1 : 0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Visibility(
            visible: model.isVisible,
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColorLight,
                size: Config.xMargin(context, 7),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).primaryColor.withOpacity(.9),
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteNames.scheduleDietReminderScreen);
                // setState(() {
                //   _insertNewDiet();
                // });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DietReminderCard extends StatelessWidget {
  final DietModel diet;

  const DietReminderCard({Key key, this.diet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(diet.foodClasses);
    var model = Provider.of<DietReminderModel>(context);
    return Padding(
      padding: EdgeInsets.only(
          left: Config.xMargin(context, 2.22),
          right: Config.xMargin(context, 2.22),
          top: Config.xMargin(context, 5.55)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(Config.xMargin(context, 2.22)),
              height: Config.yMargin(context, 18.75),
              width: Config.xMargin(context, 105.55),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.circular(Config.xMargin(context, 4.17)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEDEFF2),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${diet.time[0]}:${diet.time[1]}'),
                      SizedBox(
                        height: Config.yMargin(context, 2),
                      ),
                      Text(model.monthFromInt(diet.startDate.month)),
                      Text(
                        '${diet.startDate.day}',
                        style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(model.weekayFromInt(diet.startDate.weekday)),
                    ],
                  ),
                  SizedBox(
                    width: Config.xMargin(context, 4),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Config.yMargin(context, 5),
                        bottom: Config.yMargin(context, 5)),
                    child: VerticalDivider(
                      width: Config.xMargin(context, 0.1),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: Config.xMargin(context, 5),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: Config.xMargin(context, 7),
                      ),
                      Text(
                        diet.dietName,
                        // model.foodClassesFromDietModel(diet.foodClasses ?? []),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Config.xMargin(context, 1),
                      ),
                      Divider(
                        thickness: Config.xMargin(context, 10),
                        height: Config.xMargin(context, 3.1),
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: Config.xMargin(context, 5),
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text('Skip'),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: Config.xMargin(context, 10),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.done),
                                SizedBox(
                                  width: Config.xMargin(context, 0.5),
                                ),
                                Text(
                                  'Done',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
