import 'package:flutter/material.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

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
                                height: 4.0,),
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
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20.0),
                      height: 120.0,
                      width: 350.0,
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
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Text('250ml',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Colors.black,
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
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                      color: color =  Color(0xffEEEEEE),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                ),
                                Container(
                                  height: 10.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      color: color =  Color(0xff617ADC),
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
                        Container(
                          margin: EdgeInsets.all(24.0),
                          height: 120.0,
                          width: 150.0,
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
                                  height: 8.0,
                                ),
                                Text('3500',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),

                                Text('calories today',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                          color: color =  Color(0xffEEEEEE),
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),
                                    ),
                                    Container(
                                      height: 7.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          color: color =  Color(0xffF2994A),
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.all(24.0),
                          height: 120.0,
                          width: 150.0,
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
                                  height: 8.0,
                                ),
                                Text('7500',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),

                                Text('steps today',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                          color: color =  Color(0xffEEEEEE),
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),
                                    ),
                                    Container(
                                      height: 7.0,
                                      width: 50.0,
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

                      height: 150.0,
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
                                  SizedBox(height: 14.0,),
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
                            height: 20.0,
                            width: 270.0,
                            child:
                            Divider(
                              color: Colors.black,
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
                      height: 127.0,
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
                              width: 25.5,
                            ),
                            Container(
                              color: Colors.black45,
                              height: 50,
                              width: 1,

                              child: VerticalDivider(
                                indent: 25.0,
                                endIndent: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: 18.5,
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
                                            height: 6.0,
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
                                        width: 57.0,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Appointment for'),
                                          SizedBox(
                                            height: 8.0,
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
                                    height: 20.0,
                                    width: 270.0,
                                    child:
                                    Divider(
                                      color: Colors.black,
                                      //indent: 50.0,
                                      endIndent: 60.0,
                                    ),
                                  ),
                                  Container(
                                    width: 188.0,
                                    height: 38.0,
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
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: color =  Color(0xff617ADC),
            ),

          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          defaultBubbleColor: Colors.white,
          backgroundColor: color =  Color(0xffFAFAFA) ,
          onTap: (index) {
            // handle tap to various page
          },
          items: <BubbledNavigationBarItem>[
            BubbledNavigationBarItem(
              icon:       Icon(CupertinoIcons.home, size: 30, color: Colors.black),
              activeIcon: Icon(CupertinoIcons.home, size: 30, color: Colors.blueAccent),
              title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 12),),
            ),
            BubbledNavigationBarItem(
              icon:       Icon(CupertinoIcons.bell, size: 30, color: Colors.black),
              activeIcon: Icon(CupertinoIcons.bell, size: 30, color: Colors.blueAccent),
              title: Text('Reminders', style: TextStyle(color: Colors.black, fontSize: 12),),
            ),

            BubbledNavigationBarItem(
              icon:       Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.black),
              activeIcon: Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.blueAccent),
              title: Text('Profile', style: TextStyle(color: Colors.black, fontSize: 12),),
            ),
          ],
        ),

      ),
    );
  }
}

