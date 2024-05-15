import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/shared_prefs_helper.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileCreated;

  ProfileProvider({this.isProfileCreated = false});

  void changeProfileCreated() async {
    isProfileCreated = true;
    SharedPreferencesHelper.saveBool(isProfileCreated, "profile created");
    notifyListeners();
  }

  void getProfileCreated() async {
    isProfileCreated = await SharedPreferencesHelper.getBool("profile created");
  }
}
