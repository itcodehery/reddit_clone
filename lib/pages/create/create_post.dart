import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String selectedValue = "1";
  String communityGuidelines =
      "Remember to keep the community friendly and inclusive! Before creating a post, please take a moment to review the community's guidelines. These guidelines help the moderators maintain a positive environment for everyone. Let's be respectful of each other's opinions and have productive discussions!";
  // items to send to the database
  // title, content, community
  String postTitle = " ";
  String postContent = " ";
  String postCommunity = " ";

  @override
  Widget build(BuildContext context) {
    //page to create a post under our username
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Post'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //save the post to the database
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TL;DR: Be Respectful",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(communityGuidelines),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Post Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: getInputDecoration('Title'),
                maxLength: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: getInputDecoration('Content'),
                maxLength: 200,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text('Choose a community:'),
                  trailing: DropdownButton(
                    value: selectedValue,
                    items: const [
                      DropdownMenuItem(value: '1', child: Text('flutter/hold')),
                      DropdownMenuItem(value: '2', child: Text('react/hold')),
                      DropdownMenuItem(value: '3', child: Text('angular/hold')),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hintText) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hintText,
    );
  }
}
