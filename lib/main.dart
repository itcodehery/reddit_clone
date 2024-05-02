import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/firebase_options.dart';
import 'package:reddit_clone/pages/communities.dart';
import 'package:reddit_clone/pages/create/create_community.dart';
import 'package:reddit_clone/pages/create/create_post.dart';
import 'package:reddit_clone/pages/home.dart';
import 'package:reddit_clone/pages/inbox.dart';
import 'package:reddit_clone/pages/people.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reddit_clone/pages/primary/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

void initializeCloudFirestore() async {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 183, 87, 58)),
          useMaterial3: true,
          fontFamily: 'Satoshi',
        ),
        home: Scaffold(
          body: [
            const MyHomePage(title: 'Home'),
            const Communities(),
            const People(),
            const Inbox(),
          ][currentIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
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
        ),
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const MyHomePage(title: 'Home'),
          '/communities': (context) => const Communities(),
          '/inbox': (context) => const Inbox(),
          '/people': (context) => const People(),
          '/create_post': (context) => const CreatePost(),
          '/create_community': (context) => const CreateSubhold(),
        });
  }
}
