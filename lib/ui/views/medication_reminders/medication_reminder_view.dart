import 'package:MedBuzz/ui/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class MedicationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeLight.primaryColorLight,
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: Navigator.of(context).pop),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              trailing: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
