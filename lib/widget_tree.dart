import 'package:flutter/material.dart';
import 'package:reddit_clone/pages/communities.dart';
import 'package:reddit_clone/pages/home.dart';
import 'package:reddit_clone/pages/inbox.dart';
import 'package:reddit_clone/pages/people.dart';
import 'package:reddit_clone/pages/primary/login.dart';
import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  WidgetTreeState createState() => WidgetTreeState();
}

class WidgetTreeState extends State<WidgetTree> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const MyHomePage(title: 'Home'),
        const Communities(),
        const People(),
        const Inbox(),
      ][_currentIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.view_list_outlined),
              label: 'Feed',
              selectedIcon: Icon(Icons.view_list),
            ),
            NavigationDestination(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Subholds',
              selectedIcon: Icon(Icons.people_alt),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_add_outlined),
              label: "People",
              selectedIcon: Icon(Icons.person_add),
            ),
            NavigationDestination(
              icon: Icon(Icons.inbox_outlined),
              label: "Inbox",
              selectedIcon: Icon(Icons.inbox),
            ),
          ]),
    );
  }
}
