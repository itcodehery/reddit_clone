import 'package:flutter/material.dart';

class MainUserProvider extends ChangeNotifier {
  String _username = " ";
  String _email = " ";
  Image profilePic =
      const Image(image: AssetImage("assets/images/default_profile.png"));

  String get username => _username;
  String get email => _email;

  void login(String username, String email, Image image) {
    _username = username;
    _email = email;

    debugPrint("Logged in as $username");
    notifyListeners();
  }

  void logout() {
    _username = " ";
    _email = " ";
    notifyListeners();
  }
}
