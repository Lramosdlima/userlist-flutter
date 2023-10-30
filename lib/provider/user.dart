import 'package:flutter/material.dart';
import 'package:userlist/data/dummy_user.dart';
import 'package:userlist/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }
}
