import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/users_fetch.dart';
import 'package:reddit_clone/models/holduser.dart';

class MainUserProvider extends ChangeNotifier {
  HoldUser? currentUser;

  void getTheDamnUser() async {
    currentUser = await getUserData();
    notifyListeners();
  }
}
