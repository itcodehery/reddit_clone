import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'the hold',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: Color.fromARGB(255, 114, 23, 17),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Myprofile(
                    user: User(
                        userId: 'userId',
                        username: 'username',
                        honor: 0,
                        email: 'email'));
              }));
            },
          ),
        ],
      ),
      //list of posts
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
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
