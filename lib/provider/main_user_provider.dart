import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/users_fetch.dart';
import 'package:reddit_clone/models/holduser.dart';

class MainUserProvider extends ChangeNotifier {
  String username = "username";
  String bio = "bio";
  String email = "email";
  int honorpoints = 0;
  String userID = "HOLD117";

  MainUserProvider({
    this.username = "username",
    this.bio = "bio",
    this.email = "email",
    this.honorpoints = 0,
    this.userID = "HOLD117",
  });

  void getMainUser() async {
    HoldUser? user = await getUserData();
    if (user != null) {
      username = user.username;
      bio = user.bio;
      email = user.email;
      honorpoints = user.honor;
      userID = user.userId;
    }
    notifyListeners();
  }

  void updateMainUser(String username, String bio, int honorpoints) {
    this.username = username;
    this.bio = bio;
    this.honorpoints = honorpoints;
    saveUserData(username, bio, honorpoints);
    notifyListeners();
  }
}
