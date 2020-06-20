import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:MedBuzz/ui/widget/dot_indicator.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController _controller;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(Config.yMargin(context, 1));
    print(Config.xMargin(context, 1));
    return Stack(
      children: <Widget>[
        PageView(
          onPageChanged: onChangedFunction,
          controller: _controller,
          children: <Widget>[
            Container(child: Text("First Screen")),
            Container(child: Text("Second Screen")),
            Container(child: Text("Third Screen"))
          ],
        ),
        Positioned(
          bottom: Config.yMargin(context, 24.8),
          left: Config.xMargin(context, 41.6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Indicator(
                positionIndex: 0,
                currentIndex: currentIndex,
              ),
              SizedBox(
                width: 10,
              ),
              Indicator(
                positionIndex: 1,
                currentIndex: currentIndex,
              ),
              SizedBox(
                width: 10,
              ),
              Indicator(
                positionIndex: 2,
                currentIndex: currentIndex,
              ),
            ],
          ),
        ),
      ],
    );
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

// class to display the screens
class FirstScreen extends StatelessWidget {
  final Config config = Config();
  final image;
  final description;

  FirstScreen({this.image, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Config.xMargin(context, 7),
          vertical: Config.yMargin(context, 4)),
          
    );
  }
}
