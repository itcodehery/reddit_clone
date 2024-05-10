import 'package:flutter/material.dart';

class MainUserProvider extends ChangeNotifier {
  String _username = " ";
  String _email = " ";

  String get username => _username;
  String get email => _email;

  void login(String username, String email) {
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
