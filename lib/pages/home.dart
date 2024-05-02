import 'package:flutter/material.dart';
import 'package:reddit_clone/components/hold_app_bar.dart';
import 'package:reddit_clone/components/text_post.dart';
import 'package:reddit_clone/helper/posts_fetch.dart';
import 'package:reddit_clone/models/post.dart';
import 'package:reddit_clone/models/user.dart';
import 'package:reddit_clone/pages/tertiary/myprofile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0), child: HoldAppBar()),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_post');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
