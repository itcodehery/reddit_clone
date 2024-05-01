import 'package:flutter/material.dart';
import 'package:reddit_clone/pages/home.dart';
import 'package:reddit_clone/pages/login.dart';
import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  WidgetTreeState createState() => WidgetTreeState();
}

class WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyHomePage(title: 'Reddit');
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
