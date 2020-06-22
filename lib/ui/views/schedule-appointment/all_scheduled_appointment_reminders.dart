import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScheduledAppointmentsPage(),
    );
  }
}

class ScheduledAppointmentsPage extends StatelessWidget {
  String month = 'July';
  int dateno = 12;
  String day = 'Thurs';
  var items = ['hi', 'hello', 'good', 'new', 'hi', 'now'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
          title: Container(
            margin: EdgeInsets.only(top: 25.0),
            child: new Text(
              'My Appointments',
              style: TextStyle(
                color: Color.fromARGB(255, 51, 51, 51),
                fontFamily: 'Segoe UI',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          leading: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 51, 51, 51),
              ),
              onPressed: () => {Navigator.pushNamed(context, '')},
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            tabs: [
              Tab(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    color: Color.fromARGB(255, 70, 70, 70),
                    fontFamily: 'Segoe UI',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Past',
                  style: TextStyle(
                    color: Color.fromARGB(255, 70, 70, 70),
                    fontFamily: 'Segoe UI',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: items.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = items[index];

                return Container(
                  height: 137.0,
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$month',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              color: Colors.grey.shade600,
                              fontSize: 9.0,
                            ),
                          ),
                          Text(
                            '$dateno',
                            style: TextStyle(
                              fontSize: 28.0,
                              color: Color.fromARGB(255, 45, 191, 195),
                            ),
                          ),
                          Text(
                            '$day',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              color: Colors.grey.shade600,
                              fontSize: 9.0,
                            ),
                          ),
                        ],
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Timing',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  color: Colors.grey.shade600,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(
                                width: 57.0,
                              ),
                              Text(
                                'Appointment For',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  color: Colors.grey.shade600,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '6:00PM',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 45.0,
                                ),
                                Text(
                                  'Dance Class',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    color: Color.fromARGB(255, 51, 51, 51),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 15.0,
                        ),
                        onPressed: () => {
                          // _asyncConfirmDialog(context),
                        },
                      ),
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
                final item = items[index];

                return Container(
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: ListTile(
                      //title: item.buildTitle(context),
                      //subtitle: item.buildSubtitle(context),
                      title: Text('hi'),
                      subtitle: Text('hello'),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//class TodaysDate {
//  String month = 'July';
//  int dateno = 12;
//  String day = 'Thurs';
//
//  TodaysDate(this.month, this.dateno, this.day);
//}

enum ConfirmAction { Cancel, Delete }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('One appointment will be deleted.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Delete);
            },
          )
        ],
      );
    },
  );
}
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, key}) : super(key: key);

//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}

//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(''),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
////              style: Theme.of(context).textTheme.headline4,
//          ],
//        ),
//      ),
//    );
//  }
//}
