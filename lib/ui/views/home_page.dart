import 'package:flutter/material.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:MedBuzz/ui/app_theme/app_theme.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor:  color =  Color(0xffE5E5E5),
        body: SafeArea(
          child: ListView(
            physics: ScrollPhysics(),
              children: [
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Good Morning,',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: Config.yMargin(context, 2),
                              ),
                              Text('Juliana',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon (Icons.notifications_none),
                            iconSize: 30.0,
                            color: Theme.of(context).primaryColorDark,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20.0),
                      height: Config.yMargin(context, 23),
                      width: Config.xMargin(context, 100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            spreadRadius: 3,
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
                            padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                            child: Row(
                              children: [
                                Image.asset('images/waterdrop.png'),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Water Tracker',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Config.yMargin(context, 2),
                                    ),
                                    Row(
                                      children: [
                                        Text('250ml',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Theme.of(context).primaryColorDark,
                                          ),
                                        ),
                                        Text(' of 3500ml',
                                          style: TextStyle(
                                            fontSize: 18.0,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: Config.yMargin(context, 2.5),
                                  decoration: BoxDecoration(
                                      color: color =  Color(0xffEEEEEE),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                ),
                                Container(
                                  height: Config.yMargin(context, 2.5),
                                  width: Config.xMargin(context, 25),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
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
                            margin: EdgeInsets.all(24.0),
                            height: Config.yMargin(context, 20),
                            width: Config.xMargin(context, 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade100,
                                  spreadRadius: 3,

                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Meal',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 1.5),
                                  ),
                                  Text('3500',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 1),
                                  ),

                                  Text('calories today',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 2),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: Config.yMargin(context, 1),
                                        decoration: BoxDecoration(
                                            color: color =  Color(0xffEEEEEE),
                                            borderRadius: BorderRadius.circular(15.0)
                                        ),
                                      ),
                                      Container(
                                        height: Config.yMargin(context, 1),
                                        width: Config.xMargin(context, 14),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).buttonColor,
                                            borderRadius: BorderRadius.circular(15.0)
                                        ),
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
                            margin: EdgeInsets.all(24.0),
                            height: Config.yMargin(context, 20),
                            width: Config.xMargin(context, 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade100,
                                  spreadRadius: 3,
                                  //blurRadius: 2,
                                  //offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Steps',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 1.5),
                                  ),
                                  Text('7500',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 1),
                                  ),

                                  Text('steps today',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 2),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: Config.yMargin(context, 1),
                                        decoration: BoxDecoration(
                                            color: color =  Color(0xffEEEEEE),
                                            borderRadius: BorderRadius.circular(15.0)
                                        ),
                                      ),
                                      Container(
                                        height: Config.yMargin(context, 1),
                                        width: Config.xMargin(context, 14),
                                        decoration: BoxDecoration(
                                            color: color =  Color(0xff76DBC9),
                                            borderRadius: BorderRadius.circular(15.0)
                                        ),
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
                      padding:  EdgeInsets.only( left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text('Daily Medications',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          FlatButton(onPressed: () {},
                            child: Text('See All',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(

                      margin: EdgeInsets.all(24.0),

                      height: Config.yMargin(context, 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            spreadRadius: 6,

                            //blurRadius: 2,
                            //offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('images/injection.png', ),
                              Column(
                                children: [
                                  Text('Promethazine,',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: Config.yMargin(context, 2),),
                                  Text('1 shots once daily',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Text('12pm',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Config.yMargin(context, 1),
                            width: Config.xMargin(context, 75),
                            child:
                            Divider(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton(
                                  onPressed: () {},
                                  child: Text('View',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                              ),
                              FlatButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.close),
                                  label: Text('Skip',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                              ),
                              FlatButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.check),
                                  label: Text('Done',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding:   EdgeInsets.only( left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Upcoming Appointments',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          FlatButton(onPressed: () {},
                            child: Text('See All',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(24.0),
                      height: Config.yMargin(context, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            spreadRadius: 3,
                            offset: Offset(1.0, 6.0),
                            //blurRadius: 2,
                            //offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('July',
                                    style: TextStyle(

                                    ),
                                  ),
                                  Text('12',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.teal.shade400,
                                    ),
                                  ),
                                  Text('Thurs',
                                    style: TextStyle(
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Config.xMargin(context, 9),
                            ),
                            Container(
                              color: Colors.black45,
                              height: Config.yMargin(context, 13),
                              width: Config.xMargin(context, 0.3),

                              child: VerticalDivider(
                                indent: 25.0,
                                endIndent: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: Config.xMargin(context, 11),
                            ),

                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Timing',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),

                                          ),
                                          SizedBox(
                                            height: Config.yMargin(context, 1),
                                          ),
                                          Text('6.00 PM',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Config.xMargin(context, 15),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Appointment for'),
                                          SizedBox(
                                            height: Config.yMargin(context, 1),
                                          ),
                                          Text('Dance Class',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Config.yMargin(context, 5),
                                    width: Config.xMargin(context, 70),
                                    child:
                                    Divider(
                                      color: Theme.of(context).primaryColorDark,
                                      //indent: 50.0,
                                      endIndent: 60.0,
                                    ),
                                  ),
                                  Container(
                                    width: Config.xMargin(context, 50),
                                    height: Config.yMargin(context, 5),
                                    child: Text('Make sure to make lots of friends',

                                    ),
                                  ),
                                ]
                            ),

                            IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                              padding: EdgeInsets.only(bottom: 90.0, ),
                              color: Colors.grey ,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          ),

        ),

        floatingActionButton: Container(
          height: Config.yMargin(context, 10),
          width: Config.xMargin(context, 20),
          child: FittedBox(
            child: FloatingActionButton(onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
            ),

          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          defaultBubbleColor: Colors.white,
          backgroundColor: Theme.of(context).backgroundColor ,
          onTap: (index) {
            // handle tap to various page
          },
          items: <BubbledNavigationBarItem>[
            BubbledNavigationBarItem(
              icon:       Icon(CupertinoIcons.home, size: 30, color: Theme.of(context).primaryColorDark),
              activeIcon: Icon(CupertinoIcons.home, size: 30, color: Colors.blueAccent),
              title: Text('Home', style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 12),),
            ),
            BubbledNavigationBarItem(
              icon:       Icon(CupertinoIcons.bell, size: 30, color: Theme.of(context).primaryColorDark),
              activeIcon: Icon(CupertinoIcons.bell, size: 30, color: Colors.blueAccent),
              title: Text('Reminders', style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 12),),
            ),

            BubbledNavigationBarItem(
              icon:       Icon(CupertinoIcons.profile_circled, size: 30, color: Theme.of(context).primaryColorDark),
              activeIcon: Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.blueAccent),
              title: Text('Profile', style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 12),),
            ),
          ],
        ),

      ),
    );
  }
}

