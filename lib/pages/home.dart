import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_clone/components/hold_app_bar.dart';
import 'package:reddit_clone/components/text_post.dart';
import 'package:reddit_clone/helper/posts_fetch.dart';
import 'package:reddit_clone/models/holduser.dart';
import 'package:reddit_clone/models/post.dart';
import 'package:reddit_clone/provider/main_user_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HoldUser? user;

  @override
  void initState() {
    super.initState();
    getTheDamnUser();
  }

  void getTheDamnUser() {
    user = Provider.of<MainUserProvider>(context).currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: HoldAppBar(
            currentUser: user,
          )),
      //list of posts
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Post> listOfPosts = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listOfPosts.length,
              itemBuilder: (context, index) {
                return TextPost(
                  post: listOfPosts[index],
                );
              },
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('the hold'),
                    Text(
                      "u/${user?.username}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: -0.5,
                        color: Color.fromARGB(255, 114, 23, 17),
                      ),
                    ),
                    Text("${user?.honor} honor"),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.compass_calibration),
              title: const Text('Explore'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_post');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
