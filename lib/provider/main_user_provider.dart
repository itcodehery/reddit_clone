import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reddit_clone/models/holduser.dart';

class MainUserProvider extends ChangeNotifier {
  HoldUser? user;

  MainUserProvider({this.user});

  Future<void> initializeUserIntoProvider({required User user}) async {
    // Fetch user data from Firebase
    final HoldUser mainuser = await FirebaseHelper().getUser(user.uid);
    this.user = mainuser;
  }
}
