import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_clone/firebase_options.dart';
import 'package:reddit_clone/helper/firebase_helper.dart';
import 'package:reddit_clone/pages/authentication/choose_profile.dart';
import 'package:reddit_clone/pages/communities.dart';
import 'package:reddit_clone/pages/create/create_community.dart';
import 'package:reddit_clone/pages/create/create_post.dart';
import 'package:reddit_clone/pages/home.dart';
import 'package:reddit_clone/pages/inbox.dart';
import 'package:reddit_clone/pages/people.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reddit_clone/pages/authentication/login.dart';
import 'package:reddit_clone/pages/overlays/searchpage.dart';
import 'package:reddit_clone/provider/main_user_provider.dart';
import 'package:reddit_clone/provider/profile_provider.dart';
import 'package:reddit_clone/widget_core.dart';
import 'package:reddit_clone/widget_tree.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        )
      ],
      child: MaterialApp(
        title: 'The Hold',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 183, 87, 58)),
          useMaterial3: true,
          fontFamily: 'Satoshi',
        ),
        home: const WidgetTree(),
        routes: {
          '/widget_core': (context) => const WidgetCore(),
          '/login': (context) => const Login(),
          '/search': (context) => const Searchpage(),
          '/home': (context) => const MyHomePage(title: 'Home'),
          '/communities': (context) => const Communities(),
          '/inbox': (context) => const Inbox(),
          '/people': (context) => const People(),
          '/create_post': (context) => const CreatePost(),
          '/create_community': (context) => const CreateSubhold(),
          '/edit_profile': (context) => const ChooseProfile(),
        },
      ),
    );
  }
}
