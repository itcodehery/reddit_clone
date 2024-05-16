import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_clone/helper/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reddit_clone/pages/authentication/choose_profile.dart';
import 'package:reddit_clone/pages/authentication/login.dart';
import 'package:reddit_clone/provider/main_user_provider.dart';
import 'package:reddit_clone/provider/profile_provider.dart';
import 'package:reddit_clone/widget_core.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  WidgetTreeState createState() => WidgetTreeState();
}

class WidgetTreeState extends State<WidgetTree> {
  final User? user = Auth().currentUser;
  bool isProfileCreated = false;

  @override
  void initState() {
    super.initState();
    initializeProviders();
  }

  Future<void> initializeProviders() async {
    context.read<MainUserProvider>().initializeUserIntoProvider(user: user!);
    context.read<ProfileProvider>().getProfileCreated();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const WidgetCore();
          } else {
            return const Login();
          }
        });
  }
}
