import 'package:MedBuzz/core/models/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserCrud extends ChangeNotifier {
  static const String _boxName = "userBoxName";

  List<User> _user = [];
  void getusers() async {
    var box = await Hive.openBox<User>(_boxName);

    _user = box.values.toList();

    notifyListeners();
  }

  User getuser(index) {
    return _user[index];
  }

  void adduser(User user) async {
    var box = await Hive.openBox<User>(_boxName);

    await box.put(user.id, user);

    _user = box.values.toList();

    box.close();

    notifyListeners();
  }
}
