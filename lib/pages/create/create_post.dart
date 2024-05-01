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
        title: const Text('Create Post',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                color: Color.fromARGB(255, 114, 23, 17))),
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
              padding: const EdgeInsets.all(16),
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
                  Text(
                    communityGuidelines,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
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
                maxLines: 5,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text(
                    'Choose a community:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text("You must be following this community"),
                  trailing: DropdownButton(
                    padding: const EdgeInsets.all(4),
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
      border: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 232, 137, 108), width: 2.0),
      ),
      hintText: hintText,
    );
  }
}
