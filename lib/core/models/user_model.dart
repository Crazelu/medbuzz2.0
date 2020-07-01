import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String image; //Could be made optional
  final bool isSubscribed;
  final String email;
  // ID might be retured from sign up and sogn in API
  final String id;

  User(
      //other fields can be marked required depending on requirements
      {@required this.name,
      this.image,
      @required this.isSubscribed,
      this.email,
      this.id});
}
