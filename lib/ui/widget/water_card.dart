import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:flutter/material.dart';

class WaterCard extends StatefulWidget {
  final double height;
  final double width;

  WaterCard({this.height, this.width});
  @override
  _WaterCardState createState() => _WaterCardState();
}

class _WaterCardState extends State<WaterCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: InkWell(
        //Navigate to screen with single reminder i.e the on user clicked on
        onTap: () {
          setState(() => isSelected = !isSelected);
        },
        splashColor: Colors.transparent,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "10:00 AM",
              ),
              SizedBox(height: widget.height * 0.02),
              Container(
                  width: widget.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: Config.xMargin(context, 3),
                      vertical: Config.yMargin(context, 1)),
                  decoration: BoxDecoration(
                    color: isSelected ?Theme.of(context).primaryColor : Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(
                        Config.xMargin(context, 5)),
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
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "images/drops.png",
                            width: widget.width * 0.2,
                            height: widget.height * 0.1,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Drink 250ml of water',
                                style: TextStyle(
                                    color: isSelected? Theme.of(context).primaryColorLight :Theme.of(context)
                                        .primaryColorDark,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: widget.height * 0.005),
                              Text(
                                'Upcoming',
                                style: TextStyle(
                                    color: isSelected? Theme.of(context).primaryColorLight :Theme.of(context)
                                        .primaryColorDark),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Config.yMargin(context, 1),
                        width: double.infinity,
                      ),
                      Visibility(
                        visible: isSelected,
                        child: Divider(
                          color: Theme.of(context).primaryColorDark,
                          height: widget.height * 0.02,
                          endIndent: 10.0,
                        ),
                      ),
                      Visibility(
                        visible: isSelected,
                                              child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'View',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected? Theme.of(context).primaryColorLight :Theme.of(context)
                                        .primaryColorDark),
                              ),
                            ),
                            FlatButton(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.close,
                                    color: isSelected? Theme.of(context).primaryColorLight :Theme.of(context)
                                        .primaryColorDark,
                                    size:
                                    Config.textSize(context, 3),
                                  ),
                                  SizedBox(
                                    width:
                                    Config.xMargin(context, 2),
                                  ),
                                  Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected ? Theme.of(context).primaryColorLight : Theme.of(context)
                                            .primaryColorDark),
                                  )
                                ],
                              ),
                              onPressed: () {},
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.done,
                                    color: isSelected? Theme.of(context).primaryColorLight :Theme.of(context)
                                        .primaryColorDark,
                                    size:
                                    Config.textSize(context, 3),
                                  ),
                                  SizedBox(
                                    width:
                                    Config.xMargin(context, 2),
                                  ),
                                  Text(
                                    'Done',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected ? Theme.of(context).primaryColorLight : Theme.of(context)
                                            .primaryColorDark),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ]),
      ),
    );
  }
}
