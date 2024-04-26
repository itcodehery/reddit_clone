import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/components/image_post.dart';
import 'package:reddit_clone/components/text_post.dart';
import 'package:reddit_clone/firebase_options.dart';
import 'package:reddit_clone/helper/posts_getter.dart';
import 'package:reddit_clone/models/Post.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 87, 58)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: DropdownButton<String>(
          value: selectedValue,
          items: const [
            DropdownMenuItem(value: '1', child: Text('Home')),
            DropdownMenuItem(value: '2', child: Text('Popular')),
            DropdownMenuItem(value: '3', child: Text('Watch')),
            DropdownMenuItem(value: '4', child: Text('Latest')),
          ],
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          for (var listitem in PostGetter().allPosts)
            if (listitem is TextPost)
              TextPostWidget(post: listitem)
            else
              ImagePostWidget(post: listitem)
        ],
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
          selectedIcon: Icon(Icons.home_filled),
        ),
        NavigationDestination(
          icon: Icon(Icons.people_alt_outlined),
          label: 'Communities',
          selectedIcon: Icon(Icons.people_alt),
        ),
        NavigationDestination(
          icon: Icon(Icons.add),
          label: 'Create',
          selectedIcon: Icon(Icons.add),
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_outlined),
          label: "Chat",
          selectedIcon: Icon(Icons.chat),
        ),
        NavigationDestination(
          icon: Icon(Icons.notifications_outlined),
          label: 'Inbox',
          selectedIcon: Icon(Icons.notifications),
        ),
      ]),
    );
  }
}
