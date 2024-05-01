import 'package:flutter/material.dart';
import 'package:reddit_clone/components/text_post.dart';
import 'package:reddit_clone/helper/posts_fetch.dart';
import 'package:reddit_clone/models/comment.dart';
import 'package:reddit_clone/models/post.dart';

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
        // title: DropdownButton<String>(
        //   value: selectedValue,
        //   items: const [
        //     DropdownMenuItem(value: '1', child: Text('Home')),
        //     DropdownMenuItem(value: '2', child: Text('Popular')),
        //     DropdownMenuItem(value: '3', child: Text('Watch')),
        //     DropdownMenuItem(value: '4', child: Text('Latest')),
        //   ],
        //   onChanged: (String? value) {
        //     setState(() {
        //       selectedValue = value!;
        //     });
        //   },
        // ),
        title: const Text('The Hold'),
        centerTitle: true,
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
