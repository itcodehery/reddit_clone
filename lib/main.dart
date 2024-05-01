import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/firebase_options.dart';
import 'package:reddit_clone/helper/users_interact.dart';
import 'package:reddit_clone/pages/communities.dart';
import 'package:reddit_clone/pages/create/create_community.dart';
import 'package:reddit_clone/pages/create/create_post.dart';
import 'package:reddit_clone/pages/home.dart';
import 'package:reddit_clone/pages/people.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reddit_clone/pages/tertiary/myprofile.dart';

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
          ][currentIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home_filled),
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_alt_outlined),
                  label: 'Communities',
                  selectedIcon: Icon(Icons.people_alt),
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_add_outlined),
                  label: "People",
                  selectedIcon: Icon(Icons.person_add),
                )
              ]),
        ),
        routes: {
          '/home': (context) => const MyHomePage(title: 'Home'),
          '/communities': (context) => const Communities(),
          '/people': (context) => const People(),
          '/create_post': (context) => const CreatePost(),
          '/create_community': (context) => const CreateSubhold(),
        });
  }
}
