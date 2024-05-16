import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/shared_prefs_helper.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileCreated;

  ProfileProvider({this.isProfileCreated = false});

  Future<void> changeProfileCreated() async {
    isProfileCreated = true;
    SharedPreferencesHelper.saveBool(isProfileCreated, "profile created");
    notifyListeners();
  }

  Future<void> getProfileCreated() async {
    isProfileCreated = await SharedPreferencesHelper.getBool("profile created");
  }
}
