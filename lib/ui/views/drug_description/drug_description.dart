import 'package:flutter/material.dart';

class DrugDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Description'),
          leading: BackButton(),
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        ),
    );
  }
}