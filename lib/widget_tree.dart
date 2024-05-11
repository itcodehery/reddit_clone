import 'package:flutter/material.dart';
import 'package:reddit_clone/pages/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reddit_clone/pages/authentication/choose_profile.dart';
import 'package:reddit_clone/pages/authentication/login.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  WidgetTreeState createState() => WidgetTreeState();
}

class WidgetTreeState extends State<WidgetTree> {
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ChooseProfile();
          } else {
            return const Login();
          }
        });
  }
}
